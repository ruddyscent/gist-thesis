#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

data = \
    [('Computer Physics Communications', 'Comput. Phys. Commun.'),
     ('Applied Optics', 'Appl. Opt.'),
     ('The Journal of Chemical Physics', 'J. Chem. Phys.'),
     ('Applied Physics B', 'Appl. Phys. B'),
     ('Electronics Letters', 'Electron. Lett.'),
     ('{IEEE} Microwave and Guided Wave Letters', '{IEEE} Microw. Guided Wave Lett.'),
     ('{IEEE} Transactions on Antennas and Propagation', '{IEEE} Trans. Antennas Propag.'),
     ('Microwave and Optical Technology Letters', 'Microw. Opt. Technol. Lett.'),
     ('{IEEE} Transactions on Nuclear Science', '{IEEE} Trans. Nucl. Sci.'),
     ('{IEEE} Transactions on Electromagnetic Compatibility', '{IEEE} Trans. Electromagn. Compat.'),
     ('Proceedings of {IEEE} Antennas and Propagation Society International Symposium', 'Proc. {IEEE} Antennas Propagat. Soc. Intl. Symp.'),
     ('Journal of Optics', 'J. Opt.'),
     ('Pure and Applied Optics', 'Pure Appl. Opt.'),
     ('Journal of the Optical Society of America', 'J. Opt. Soc. Am.'),
     ('Journal of Physics', 'J. Phys.'),
     ('Applied Physics', 'Appl. Phys.'),
     ('Physical Review', 'Phys. Rev.'),
     ('{IEEE} Transactions on Microwave Theory and Techniques', '{IEEE} Trans. Microw. Theory Tech.'),
     ('Journal of Computational and Theoretical Nanoscience', 'J. Comput. Theor. Nanos.'),
     ('{IEEE} Antennas and Propagation Magazine', '{IEEE} Antennas Propag. Mag.'),
     ('š', r'{\v s}'),
     ('Elasto-optical constants of Si', 'Elasto-optical constants of {Si}'),
     ('[J. Chem. Phys. 125, 164705 (2006)]', '[{J. Chem. Phys.} 125, 164705 (2006)]'),
     (r'Erratum: {"', r'Erratum: {``')
     # ('MPI for Python User Manual', '{MPI} for Python User Manual'),
     # ('MPI for Python: Release 1.3', '{MPI} for Python: Release 1.3')
]

with open(sys.argv[1], 'r') as f:
    original = f.readlines()

converted = []
for line in original:
    for full, abbrev in data:
        line = line.replace(full, abbrev)
    converted.append(line)

with open(sys.argv[2], 'w') as f:
    for line in converted:
        f.write(line)
