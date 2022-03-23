import './App.css';
import React, { useState } from 'react';
import AuthContainer from './Auth/AuthContainer';
import Header from './Pages/Header';
import { UserContext } from './Context/UserContext';
import Home from './Pages/Home';

function App() {
	const [user, setUser] = useState({});

	return (
		<div>
			<UserContext.Provider value={[user, setUser]}>
				<Header />
				{user.uid ? <Home /> : <AuthContainer />}
			</UserContext.Provider>
		</div>
	);
}

export default App;
