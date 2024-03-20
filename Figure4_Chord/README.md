Files in the ./data/ subfolder are related to the Figure 4 of the manuscript. 
program_clean.R generates Figure 4. 

1. barcolor_out.csv，barheight_out.csv，bgcolor_out.csv，bglwd_out.csv; These files are all designed to draw stacked histograms in the outermost circle of Figure 4. The format is uniform: each row represents a strain, and the number of columns represents the number of modules in the longest NRPS.
The meanings of the four files are:
barcolor is the color coding for each substrate；
barheight is the height of each substrate column；
bgcolor is the color of each substrate column border；
bgcolor is the width of each substrate column border；


2. digit_link is the connection information in the middle of Figure 4. 
Column 1: Connection starting strain
Column 2: Strain at the end of the connection
Column 3: The number of strain repetitions at the beginning of the connection (the thickness of the start of the connection)
Column 4: The number of strain repetitions at the end of the connection (the thickness of the end of the connection)
Columns 5-6: Species information at the beginning and end of the connection
Column 7: Color of the connection
Columns 8-9: Drawing is useless
Column 10: Phylogenetic distance of species at both ends of the line (Curvature height of the line)


3. main_allstrains.csv is the basic information of 1928 pseudomonas strains, which contains strains name, species name, species color coding, receptor diversity between different species, and color representation of different receptor diversity sizes.


4. splist_knowpyo_struct.csv represents that the siderophore structure secreted by these strains has been reported. It is marked with a red dot in the third circle of Figure 4.
