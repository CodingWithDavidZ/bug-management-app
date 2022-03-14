import React from 'react';
import { auth } from '../firebase-config';
import { signOut } from 'firebase/auth';
import { useEffect } from 'react';

function Header({ setUser, user }) {
	const logout = async () => {
		await signOut(auth);
		logoutOfServer();
		setUser({});
	};

	async function logoutOfServer() {
		await fetch('localhost:3000/logout', { method: 'DELETE' }).then((r) => {
			if (r.status === 200) {
				console.log('logout of server successful');
			} else {
				console.log('logout of server failed');
			}
		});
	}

	// display welcome if user is logged in and display "please login" if user is not logged in

	function displayWelcome() {
		console.log('Header/displayWelcome: user', user);
		if (user !== null) {
			return (
				<h3 className='col-start-1 col-auto text-white'>
					Welcome: {user.username}
				</h3>
			);
		} else {
			return (
				<h3 className='col-start-1 col-auto text-white'>
					Please Login or Register
				</h3>
			);
		}
	}

	return (
		<div className='grid grid-cols-6 gap-4 content-start bg-gray-700 h-8'>
			{displayWelcome()}

			<button
				className='col-start-6 col-auto border rounded bg-red-400 max-width- text-white hover:bg-red'
				onClick={logout}
			>
				Logout
			</button>
		</div>
	);
}

export default Header;
