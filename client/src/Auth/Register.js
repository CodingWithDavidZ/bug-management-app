import React from 'react';
import { auth } from '../firebase-config';
import { createUserWithEmailAndPassword, getAuth } from 'firebase/auth';

function Register({
	registerEmail,
	setRegisterEmail,
	registerPassword,
	setRegisterPassword,
	setUser,
	user,
	sendUserToBackend,
	additionalUserInfo,
	setAdditionalUserInfo,
}) {
	function register() {
		getAuth();
		createUserWithEmailAndPassword(
			auth,
			registerEmail,
			registerPassword,
			setAdditionalUserInfo
		)
			.then((userCredential) => {
				// Signed in
				let user = userCredential.user;
				setUser(user);
				sendUserToBackend(user, 'register');
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
				// ..
			});
	}

	return (
		<div className='w-full max-w-xs'>
			<h3>Register User:</h3>
			<div className='bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4'>
				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Username
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='Username'
					required={true}
					value={additionalUserInfo.username}
					onChange={(e) => {
						setAdditionalUserInfo({
							...additionalUserInfo,
							username: e.target.value,
						});
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					First Name
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='First Name'
					value={additionalUserInfo.first_name}
					required={true}
					onChange={(e) => {
						setAdditionalUserInfo({
							...additionalUserInfo,
							first_name: e.target.value,
						});
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Last Name
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='Last Name'
					value={additionalUserInfo.last_name}
					required={true}
					onChange={(e) => {
						setAdditionalUserInfo({
							...additionalUserInfo,
							last_name: e.target.value,
						});
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Email
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='Email'
					value={registerEmail}
					required={true}
					onChange={(e) => {
						setRegisterEmail(e.target.value);
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Password
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='Password'
					value={registerPassword}
					required={true}
					onChange={(e) => {
						setRegisterPassword(e.target.value);
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Image URL
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					placeholder='Image URL'
					value={additionalUserInfo.avatar}
					onChange={(e) => {
						setAdditionalUserInfo({
							...additionalUserInfo,
							avatar: e.target.value,
						});
					}}
				/>

				<button
					className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
					onClick={register}
				>
					Create User
				</button>
			</div>
		</div>
	);
}

export default Register;
