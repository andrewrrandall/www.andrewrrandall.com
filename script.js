document.addEventListener('DOMContentLoaded', async function() {
    const username = 'andrewrrandall';
    
    try {
        const response = await fetch(`https://github-contributions-api.jogruber.de/v4/${username}`);
        const data = await response.json();
        
        const totalThisYear = data.total[new Date().getFullYear()] || 0;
        document.getElementById('contribution-count').innerHTML = 
            `<strong>${totalThisYear}</strong> contributions in ${new Date().getFullYear()}`;
        
    } catch (error) {
        console.log('Could not fetch GitHub data:', error);
    }
});