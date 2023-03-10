################################################################################
#
#    Copyright 2022-… @ Félix Brezo (@febrezo)
#
#    This program is part of Automedia. You can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

import random
import textwrap

from .fortunes import messages
from .colors import emphasis
from .colors import error
from .colors import success
from .colors import title
from .colors import warning


LICENSE_URL = "https://www.gnu.org/licenses/agpl-3.0.txt"

logo = """
                _         _                           _ _       
               / \  _   _| |_ ___  _ __ ___   ___  __| (_) __ _ 
              / _ \| | | | __/ _ \| '_ ` _ \ / _ \/ _` | |/ _` |
             / ___ \ |_| | || (_) | | | | | |  __/ (_| | | (_| |
            /_/   \_\__,_|\__\___/|_| |_| |_|\___|\__,_|_|\__,_|
                                                            
"""

header = f"""
{title(logo)}


{f"Coded with {error('♥')} by {success('Félix Brezo')} since {emphasis('2022')}".center(113)}

{f"License: {title('AGPLv3')}".center(94)}


{warning(random.choice(messages).center(80))}

"""

welcome = textwrap.dedent(header)


def show_license():
    """Method that prints the license if requested.
    It tries to find the license online and manually download it. This method
    only prints its contents in plain text.
    """
    print("Trying to recover the contents of the license...\n")
    try:
        # Grab the license online and print it.
        text = urllib.urlopen(LICENSE_URL).read()
        print("License retrieved from " + emphasis(LICENSE_URL) + ".")
        raw_input("\n\tPress " + emphasis("<ENTER>") + " to print it.\n")
        print(text)
    except:
        print(warning("The license could not be downloaded and printed."))
