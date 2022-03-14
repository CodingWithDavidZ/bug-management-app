import React from 'react';
import { auth } from '../firebase-config';
import { signInWithEmailAndPassword, getAuth } from 'firebase/auth';

function Login({
	setUser,
	sendUserToBackend,
	loginEmail,
	loginPassword,
	setLoginEmail,
	setLoginPassword,
}) {
	const login = () => {
		getAuth();
		signInWithEmailAndPassword(auth, loginEmail, loginPassword)
			.then((userCredential) => {
				// Signed in
				let user = userCredential.user;
				setUser(user);
				sendUserToBackend(user, 'login');
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

	return (
		<div className='w-full max-w-xs'>
			<h3>Login User:</h3>
			<div
				className='bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4'
				onSubmit={login}
			>
				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Email
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					required={true}
					placeholder='Email'
					onChange={(e) => {
						setLoginEmail(e.target.value);
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Password
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					required={true}
					placeholder='Password'
					onChange={(e) => {
						setLoginPassword(e.target.value);
					}}
				/>

				<button
					className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
					onClick={login}
				>
					Login User
				</button>
			</div>
		</div>
	);
}

export default Login;
