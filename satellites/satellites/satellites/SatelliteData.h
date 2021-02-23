#pragma once

class SatelliteData {
	/*
	 *  Notes: Should maybe use python converter to convert TLE data to EFEC and only after that read the file
	 */
	const char* firstLine;		// Satellite dataset has two lines for each satellite
	const char* secondLine;
};