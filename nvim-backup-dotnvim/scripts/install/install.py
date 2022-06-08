import sys
import os
import distro

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from arch import NeovimInstaller as ArchNeovimInstaller

distro_id = distro.id()

installer = None

match distro_id:
    case 'arch':
        installer = ArchNeovimInstaller()
    case _:
        raise Exception('Unable to find neovim installer for ')

installer.lnstall_prerequisites()
