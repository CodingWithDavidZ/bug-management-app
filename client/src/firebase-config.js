// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';
import { getAuth } from 'firebase/auth';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
// const firebaseConfig = {
// 	apiKey: process.env.REACT_APP_FB_API_KEY,
// 	authDomain: process.env.REACT_APP_AUTH_DOMAIN,
// 	projectId: process.env.REACT_APP_PROJECT_ID,
// 	storageBucket: process.env.REACT_APP_STORAGE_BUCKET,
// 	messagingSenderId: process.env.REACT_APP_MESSAGING_SENDER_ID,
// 	appId: process.env.REACT_APP_APP_ID,
// 	measurementId: process.env.REACT_APP_MEASUREMENT_ID,
// };
const firebaseConfig = {
	apiKey: 'AIzaSyCKPBKet09U308sCdEksUk02cDP8xxSzaY',

	authDomain: 'bug-management-system.firebaseapp.com',

	projectId: 'bug-management-system',

	storageBucket: 'bug-management-system.appspot.com',

	messagingSenderId: '172346392983',

	appId: '1:172346392983:web:768195d15390f05f9ec4d2',

	measurementId: 'G-CD7M3C9R8G',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth = getAuth(app);
