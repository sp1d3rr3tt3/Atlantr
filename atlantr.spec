# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['3.0/atr3.py'],
    pathex=[],
    binaries=[],
    datas=[
        ('3.0/hoster.dat', '.'),
        ('3.0/matchers.dat', '.'),
    ],
    hiddenimports=['gevent', 'tqdm', 'email', 'imaplib'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='atlantr',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
