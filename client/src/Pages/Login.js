import React from 'react';
import { auth, signInWithGoogle, signInWithGithub } from '../firebase-config';
import {
	createUserWithEmailAndPassword,
	signInWithEmailAndPassword,
	onAuthStateChanged,
	signOut,
} from 'firebase/auth';
import { useState } from 'react';

function Login() {
	const [registerEmail, setRegisterEmail] = useState('');
	const [registerPassword, setRegisterPassword] = useState('');
	const [loginEmail, setLoginEmail] = useState('');
	const [loginPassword, setLoginPassword] = useState('');
	const [username, setUsername] = useState('');

	const [user, setUser] = useState({});

	onAuthStateChanged(auth, (currentUser) => {
		setUser(currentUser);
	});

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

	const login = async () => {
		try {
			const user = await signInWithEmailAndPassword(
				auth,
				loginEmail,
				loginPassword
			);
			console.log('USER', user);
		} catch (error) {
			console.log('loginUser ERROR @login.js', error.message);
		}
	};

	const logout = async () => {
		await signOut(auth);
	};

	return (
		<div className='container'>
			<div>
				{/* Google Auth Popup */}
				<div>
					<button onClick={signInWithGoogle}>Sign in with Google</button>
				</div>
				{/* Google Auth Popup */}

				<h3>---OR---</h3>

				{/* Github Auth Popup */}
				<div>
					<button onClick={signInWithGithub}>Sign in with Github</button>
				</div>
				{/* Github Auth Popup */}

				<h3>---OR---</h3>

				<h3>Register User:</h3>
				<input
					placeholder='Username'
					value={username}
					onChange={(e) => setUsername(e.target.value)}
				/>
				<input
					placeholder='Email'
					value={registerEmail}
					onChange={(e) => {
						setRegisterEmail(e.target.value);
					}}
				/>
				<input
					placeholder='Password'
					value={registerPassword}
					onChange={(e) => {
						setRegisterPassword(e.target.value);
					}}
				/>

				<button onClick={register}>Create User</button>
			</div>

			<div>
				<h3>Login User:</h3>
				<input
					placeholder='Email'
					value={loginEmail}
					onChange={(e) => {
						setLoginEmail(e.target.value);
					}}
				/>
				<input
					placeholder='Password'
					value={loginPassword}
					onChange={(e) => {
						setLoginPassword(e.target.value);
					}}
				/>

				<button onClick={login}>Login User</button>
			</div>

			<div>
				<h3>Current User:</h3>
				{user?.email}
				<button onClick={logout}>Logout</button>
			</div>
		</div>
	);
}

export default Login;
