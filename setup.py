#!/usr/bin/env python
from distutils.core import setup
from distutils.command.install_lib import install_lib
from distutils.dep_util import newer
from fnmatch import fnmatch
import os
import sys

class InstallLib(install_lib):
    def install(self):
        installed_template = '''# Generated by setup.py do not modify
import os
prefix = r"%(prefix)s"
basedir = r"%(basedir)s"
pixmap_dir = os.path.join(prefix, 'share', 'stoq', 'pixmaps')
glade_dir = os.path.join(prefix, 'share', 'stoq', 'glade')
'''
        filename = os.path.join(self.build_dir, 'stoq', 
                                '__installed__.py')
        install = self.distribution.get_command_obj('install')
	    # Overkill: Don't generate the file if we have the same prefix
        if (os.path.exists(filename) and not newer(__file__, filename)):
            d = {}
            try:
                execfile(filename, {}, d)		
            except Exception, e:
                raise SystemExit('Error: %s' % e)
            if d.get('prefix') == install.prefix:
                return install_lib.install(self)

        self.mkpath(os.path.dirname(filename))
        fp = open(filename, 'w')
        basedir = os.path.join(install.prefix, 'lib',
                               'python%d.%d' % sys.version_info[:2],
                               'site-packages')
        fp.write(installed_template % dict(prefix=install.prefix,
                                           basedir=basedir))
        fp.close()
	return install_lib.install(self) + [filename]

def listfiles(*dirs):
    dir, pattern = os.path.split(os.path.join(*dirs))
    return [os.path.join(dir, filename)
            for filename in os.listdir(os.path.abspath(dir))
                if filename[0] != '.' and fnmatch(filename, pattern)]

def listgladefiles(*dirs):
    retval = []
    for dir in dirs:
        retval.extend(listfiles('stoq', 'gui', dir, 'glade', '*glade'))
    return retval

data_files = [
    ('share/stoq/pixmaps',
     listfiles('pixmaps', '*.xpm') +
     listfiles('pixmaps', '*.jpg')),
    ('share/stoq/glade',
     listgladefiles('components', 'editors', 'search', 'slaves',
                    'pos', 'templates')),
    ]

setup(name='stoq',
      version='0.2.0',
      author='Async Open Source',
      author_email='evandro@async.com.br',
      url='http://www.async.com.br/projects/stoq/',
      license='GPL',
      packages=['stoq',
                'stoq.domain',
                'stoq.gui',
                'stoq.gui.components',
                'stoq.gui.editors',
                'stoq.gui.pos',
                'stoq.gui.search',
                'stoq.gui.slaves',
                'stoq.gui.templates',
                'stoq.lib'],
      scripts=['bin/stoq'],
      data_files=data_files,
      cmdclass=dict(install_lib=InstallLib))

