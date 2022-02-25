import { useState } from 'react';

export const [userObject, setUserObject] = useState({
	displayName: '',
	email: '',
	emailVerified: false,
	isAnonymous: false,
	metadata: {
		creationTime: '',
		lastSignInTime: '',
	},
	multiFactor: {
		enrolled: false,
		enrolledFactors: [
			{
				displayName: '',
				factorId: '',
				id: '',
				provider: '',
				uid: '',
			},
		],
	},
	phoneNumber: '',
	photoURL: '',
	providerData: [
		{
			displayName: '',
			email: '',
			phoneNumber: '',
			photoURL: '',
			providerId: '',
			uid: '',
		},
	],
	providerId: '',
	refreshToken: '',
	tenantId: '',
	uid: '',
});
