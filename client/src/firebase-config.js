// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';
import { getAuth } from 'firebase/auth';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
	apiKey: 'AIzaSyDFyie8OD67Zere7FLdE5KU7ffodL5AigU',
	authDomain: 'bug-management-app.firebaseapp.com',
	projectId: 'bug-management-app',
	storageBucket: 'bug-management-app.appspot.com',
	messagingSenderId: '995540254466',
	appId: '1:995540254466:web:bf6439e296d720e5afcc1b',
	measurementId: 'G-RTHVE0W09Q',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth = getAuth(app);
