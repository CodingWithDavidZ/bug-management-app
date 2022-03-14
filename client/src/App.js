import './App.css';
import { useState } from 'react';
import AuthContainer from './Auth/AuthContainer';
import Header from './Pages/Header';

function App() {
	const [user, setUser] = useState({});

	return (
		<div>
			<Header setUser={setUser} user={user} />
			<AuthContainer user={user} setUser={setUser} />
		</div>
	);
}

export default App;
