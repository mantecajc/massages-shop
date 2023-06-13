const toggleNavigation = () => {
	const mobileNavigation = document.getElementById("mobile-navigation");
	toggle.onclick = () => {
		toggle.classList.toggle("close")
		mobileNavigation.classList.toggle("translate-x-full")
		mobileNavigation.classList.toggle("translate-x-0")
		document.body.classList.toggle("fixed")
	}
}

export { toggleNavigation }
