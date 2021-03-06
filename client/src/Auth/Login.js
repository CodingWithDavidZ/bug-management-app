import React, { useContext, useState } from 'react';
import { UserContext } from '../Context/UserContext';

function Login({ sendUserToBackend }) {
	const [user, setUser] = useContext(UserContext);
	const [userLogin, setUserLogin] = useState({
		username: '',
		password: '',
	});

	async function login(e) {
		e.preventDefault();
		const res = await fetch('http://localhost:3000/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				username: userLogin.username,
				password: userLogin.password,
			}),
		});
		if (res.status === 200) {
			const user = await res.json();
			setUser(user);
			console.log('Login > user', user);
		} else {
			setUserLogin({
				username: '',
				password: '',
			});
		}
	}

	return (
		<div className='w-full max-w-xs' onSubmit={login}>
			<h3>Login User:</h3>
			<form
				className='bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4'
				onSubmit={login}
			>
				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Username
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					required={true}
					placeholder='username'
					value={userLogin.username}
					onChange={(e) => {
						setUserLogin({
							...userLogin,
							username: e.target.value,
						});
					}}
				/>

				<label className='block text-gray-700 text-sm font-bold mb-2'>
					Password
				</label>
				<input
					className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
					required={true}
					placeholder='Password'
					value={userLogin.password}
					onChange={(e) => {
						setUserLogin({
							...userLogin,
							password: e.target.value,
						});
					}}
				/>

				<button
					className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
					onClick={login}
				>
					Login User
				</button>
			</form>
		</div>
	);
}

export default Login;
