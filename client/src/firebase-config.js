// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';
import { getAuth } from 'firebase/auth';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
	apiKey: 'AIzaSyA0MahAa4cL6hNCnc70nhP_dc1mv-oixmE',
	authDomain: 'bug-management-app-c1267.firebaseapp.com',
	projectId: 'bug-management-app-c1267',
	storageBucket: 'bug-management-app-c1267.appspot.com',
	messagingSenderId: '979808435891',
	appId: '1:979808435891:web:d8a1b960c44aea6d7abac6',
	measurementId: 'G-8P0E83XLQB',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth = getAuth(app);
