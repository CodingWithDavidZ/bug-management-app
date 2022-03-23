import React, { useState } from 'react';
import { useSelect } from 'downshift';
import { GiHamburgerMenu } from 'react-icons/gi';

function TableDropdownButton() {
	const [isSelected, setIsSelected] = useState('');
	const hamburger = <GiHamburgerMenu />;
	const options = [
		{
			value: null,
			label: <img src='../../resources/Menu_icon_icon-icons.com_71858.png' />,
		},
		{
			value: 'edit',
			label: 'Edit',
		},
		{
			value: 'delete',
			label: 'Delete',
		},
	];
	console.log(hamburger);

	function handleSortChange(e) {
		setIsSelected(e.target.value);
		console.log('Selected', isSelected);
	}

	return (
		<div className=''>
			<p>{hamburger}</p>
			{/* <select
				value={isSelected}
				// aria-label='select'
				className='focus:text-indigo-600 focus:outline-none bg-transparent ml-1'
				onChange={handleSortChange}
			>
				{options.map((option) => (
					<option className='text-sm text-indigo-800'>{hamburger}</option>
				))}
			</select> */}
		</div>
	);
}

export default TableDropdownButton;
