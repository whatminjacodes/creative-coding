#include "ofApp.h"
#include "Satellite.h"
#include <vector>

//--------------------------------------------------------------
void ofApp::setup() {
	vector<Satellite> satellites;
	vector<Test> testidata;
	loadSettings();

}

void ofApp::saveSettings() {
	/*std::ofstream fout;
	fout.open(ofToDataPath("calibration.txt").c_str());


	fout << translation.x << " " << translation.y << endl
		<< rotAngle << endl
		<< scale.x << " " << scale.y << endl
		<< A.x << " " << A.y << endl
		<< B.x << " " << B.y << endl
		<< C.x << " " << C.y << endl
		<< D.x << " " << D.y << endl
		<< camIntrinsics[0] << " " << camIntrinsics[4] << endl
		<< camIntrinsics[2] << " " << camIntrinsics[5] << endl
		<< distortionCoeffs[0] << " " << distortionCoeffs[1] << endl
		<< distortionCoeffs[2] << " " << distortionCoeffs[3] << endl;

	fout.close();*/
}

void ofApp::initializeTestiData(vector<Test> testidata, int lineCount) {
	int lineNumber = 0;

	while (lineNumber <= lineCount)
	{
		Test testiobjekti;
		testiobjekti.x = 0;
		testiobjekti.y = 0;
		testiobjekti.z = 0;
		testidata.push_back(testiobjekti);

		lineNumber++;
	}
}



void ofApp::loadSettings() {

	std::ifstream fin;
	fin.open(ofToDataPath("test.txt").c_str());
	string path = ofToDataPath("test.txt").c_str();
	//std::ifstream inFile("file");
	int lineCount = std::count(std::istreambuf_iterator<char>(fin),
		std::istreambuf_iterator<char>(), '\n');
	vector<Test> testidata;
	initializeTestiData(testidata, lineCount);

	int a, b, c;
	
	while (fin >> a >> b >> c) {
		Test satelliteObject;
		fin >> satelliteObject.x >> satelliteObject.y >> satelliteObject.z;
		testidata.push_back(satelliteObject);
	}

	fin.close();

	/*fin >> translation.x >> translation.y
		>> rotAngle
		>> scale.x >> scale.y
		>> A.x >> A.y
		>> B.x >> B.y
		>> C.x >> C.y
		>> D.x >> D.y
		>> camIntrinsics[0] >> camIntrinsics[4]
		>> camIntrinsics[2] >> camIntrinsics[5]
		>> distortionCoeffs[0] >> distortionCoeffs[1]
		>> distortionCoeffs[2] >> distortionCoeffs[3];

	fin.close();*/
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
