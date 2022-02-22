import React from 'react';
import { auth } from '../firebase-config';
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
				<h3>Current User:</h3>
				{user?.email}
				<button onClick={logout}>Logout</button>
			</div>
		</div>
	);
}

export default Login;
