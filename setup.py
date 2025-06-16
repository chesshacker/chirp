from setuptools import setup
from setuptools import find_packages
import sys

APP = ['chirp/wxui/main.py']
DATA_FILES = []
OPTIONS = {
    'argv_emulation': True,
    'packages': ['chirp'],
    'includes': ['wx'],
    'iconfile': 'chirp/wxui/chirp.icns',
    'plist': {
        'CFBundleName': 'CHIRP',
        'CFBundleDisplayName': 'CHIRP',
        'CFBundleGetInfoString': 'CHIRP Radio Programming Software',
        'CFBundleIdentifier': 'com.danplanet.chirp',
        'CFBundleVersion': '0',
        'CFBundleShortVersionString': '0',
        'NSHumanReadableCopyright': 'Copyright © 2024 Dan Smith',
    }
}

setup(name='chirp',
      description='A cross-platform cross-radio programming tool',
      packages=find_packages(include=["chirp*"]),
      include_package_data=True,
      version=0,
      url='https://chirp.danplanet.com',
      python_requires=">=3.10,<4",
      install_requires=[
          'pyserial',
          'requests',
          'yattag',
          'suds',
          'lark',
      ],
      extras_require={
          'wx': ['wxPython'],
      },
      entry_points={
          'console_scripts': [
              "chirp=chirp.wxui:chirpmain",
              "chirpc=chirp.cli.main:main",
              "experttune=chirp.cli.experttune:main",
          ],
      },
      app=APP,
      data_files=DATA_FILES,
      options={'py2app': OPTIONS},
      setup_requires=['py2app'],
      )
