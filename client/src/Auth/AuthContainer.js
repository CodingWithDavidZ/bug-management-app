import React from 'react';
import { useState } from 'react';
import { auth } from '../firebase-config';
import { onAuthStateChanged } from 'firebase/auth';
import Login from './Login';
import Register from './Register';

function AuthContainer({ user, setUser }) {
	const [registerEmail, setRegisterEmail] = useState('');
	const [registerPassword, setRegisterPassword] = useState('');
	const [loginEmail, setLoginEmail] = useState('');
	const [loginPassword, setLoginPassword] = useState('');
	const [additionalUserInfo, setAdditionalUserInfo] = useState({
		username: '',
		first_name: '',
		last_name: '',
		avatar: '',
	});

	const [authType, setAuthType] = useState('');

	function renderRegisterAuth() {
		setAuthType('register');
	}
	function renderLoginAuth() {
		setAuthType('login');
	}

	// onAuthStateChanged(auth, (currentUser) => {
	// 	//TODO: this is updating user without the additionalUserInfo
	// 	setUser(currentUser);
	// });

	function sendUserToBackend(user, type) {
		fetch(`http://localhost:3000/${type}`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				firebase_access_token: user.accessToken,
				//TODO implement following fields
				username: additionalUserInfo.username,
				first_name: additionalUserInfo.first_name,
				last_name: additionalUserInfo.last_name,
				// role: role,
				// team_id: teamId,
				// is_team_lead: isTeamLead,
				avatar: additionalUserInfo.avatar,
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
				console.log('AuthContainer > sendUserToBackend > data', data);
				setUser(data);
			})
			.catch((error) => {
				console.error(error);
			});
	}

	function renderAuthMethod(authMethod) {
		switch (authMethod) {
			case 'login':
				return (
					<Login
						setUser={setUser}
						sendUserToBackend={sendUserToBackend}
						loginEmail={loginEmail}
						loginPassword={loginPassword}
						setLoginEmail={setLoginEmail}
						setLoginPassword={setLoginPassword}
					/>
				);
			case 'register':
				return (
					<Register
						setUser={setUser}
						sendUserToBackend={sendUserToBackend}
						registerEmail={registerEmail}
						registerPassword={registerPassword}
						setRegisterEmail={setRegisterEmail}
						setRegisterPassword={setRegisterPassword}
						additionalUserInfo={additionalUserInfo}
						setAdditionalUserInfo={setAdditionalUserInfo}
					/>
				);
			default:
				return (
					<Login
						setUser={setUser}
						sendUserToBackend={sendUserToBackend}
						loginEmail={loginEmail}
						loginPassword={loginPassword}
						setLoginEmail={setLoginEmail}
						setLoginPassword={setLoginPassword}
					/>
				);
		}
	}

	return (
		<>
			<div className='grid grid-cols-12 gap-1 content-start'>
				<button
					className='bg-red-700 rounded border hover:animate-pulse'
					onClick={renderRegisterAuth}
				>
					Register
				</button>
				<button
					className='bg-green-700 rounded border hover:animate-pulse'
					onClick={renderLoginAuth}
				>
					Login
				</button>
			</div>
			<div>{renderAuthMethod(authType)}</div>
		</>
	);
}

export default AuthContainer;
