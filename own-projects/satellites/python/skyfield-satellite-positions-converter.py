# Python script for converting TLE satellite data into x, y and Z coordinates
from skyfield.api import load, wgs84
import os

# Load the filecontaining the satellite data in TLE format
satellite_data = load.tle_file('file_name.txt')
print ('Loaded', len(satellite_data), ' satellites')

new_file_name = "satellite-position-data.txt"

# Check if file with given name already exists
if os.path.exists(new_file_name):
	os.remove(new_file_name)
	print("Removed existing file")

ts = load.timescale()
t = ts.now()

# Create new file
f = open(new_file_name, "w")
x = 0
for satellite in satellite_data:
	# Get the position data of each satellite and write it to the file
	geocent = satellite.at(t)
	f.write(str(geocent.position.km) + '\n')
f.close()


