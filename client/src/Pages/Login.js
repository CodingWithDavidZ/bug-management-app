import React from 'react';
import { auth } from '../firebase-config';
import {
	createUserWithEmailAndPassword,
	signInWithEmailAndPassword,
	onAuthStateChanged,
	signOut,
	getAuth,
} from 'firebase/auth';
import { useState } from 'react';

function Login() {
	const [registerEmail, setRegisterEmail] = useState('');
	const [registerPassword, setRegisterPassword] = useState('');
	const [loginEmail, setLoginEmail] = useState('');
	const [loginPassword, setLoginPassword] = useState('');

	const [user, setUser] = useState({});

	onAuthStateChanged(auth, (currentUser) => {
		setUser(currentUser);
	});

	function sendAccessTokenToBackend(accessToken) {
		fetch('/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				firebase_access_token: accessToken,
				//TODO implement following fields
				// username: username,
				// first_name: firstName,
				// last_name: lastName,
				// role: role,
				// team_id: teamId,
				// is_team_lead: isTeamLead,
				// avatar: avatarUrl,
				firebase_phone_number: user.phoneNumber,
				firebase_email: user.email,
				firebase_email_verified: user.emailVerified,
				firebase_provider_id: user.providerId,
				firebase_display_name: user.displayName,
				firebase_is_anonymous: user.isAnonymous,
				firebase_metadata_creationTime: user.metadata.creationTime,
				firebase_metadata_lastSignInTime: user.metadata.lastSignInTime,
				firebase_client_version: user.clientVersion,
				firebase_photo: user.photoURL,
				firebase_tenant_id: user.tenantId,
				firebase_uid: user.uid,
			}),
		})
			.then((response) => response.json())
			.then((data) => {
				console.log(data);
			})
			.catch((error) => {
				console.error(error);
			});
	}

	const register = async () => {
		try {
			const user = await createUserWithEmailAndPassword(
				auth,
				registerEmail,
				registerPassword
			);
			console.log('USER', user);
		} catch (error) {
			console.log('registerUser ERROR @login.js', error.message);
		}
	};

	const login = () => {
		getAuth();
		signInWithEmailAndPassword(auth, loginEmail, loginPassword)
			.then((userCredential) => {
				// Signed in
				let user = userCredential.user;
				setUser(user);
				sendAccessTokenToBackend(user.accessToken);
				// ...
			})
			.catch((error) => {
				const errorCode = error.code;
				const errorMessage = error.message;
				console.log(
					'loginErrorCode:',
					errorCode,
					'loginErrorMessage:',
					errorMessage
				);
			});
	};

	const logout = async () => {
		await signOut(auth);
	};

	return (
		<div className='container'>
			<div>
				<h3>Register User</h3>
				<input
					placeholder='Email'
					onChange={(e) => {
						setRegisterEmail(e.target.value);
					}}
				/>
				<input
					placeholder='Password'
					onChange={(e) => {
						setRegisterPassword(e.target.value);
					}}
				/>

				<button onClick={register}>Create User</button>
			</div>

			<div>
				<h3>Login User</h3>
				<input
					placeholder='Email'
					onChange={(e) => {
						setLoginEmail(e.target.value);
					}}
				/>
				<input
					placeholder='Password'
					onChange={(e) => {
						setLoginPassword(e.target.value);
					}}
				/>

				<button onClick={login}>Login User</button>
			</div>

			<div>
				<h3>Current User: </h3>
				{user?.email} &nbsp;
				<button onClick={logout}>Logout</button>
			</div>
		</div>
	);
}

export default Login;
