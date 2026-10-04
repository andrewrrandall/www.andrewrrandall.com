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

document.addEventListener('DOMContentLoaded', function() {
    const trigger = document.querySelector('.weather-hover');
    if (!trigger) return;
    const tooltip = trigger.querySelector('.weather-tooltip');
    const url = 'https://api.open-meteo.com/v1/forecast?latitude=40.6782&longitude=-73.9442' +
        '&current=temperature_2m,weather_code,is_day&temperature_unit=fahrenheit&timezone=America%2FNew_York';
    let request = null;

    function describe(code, isDay) {
        if (code === 0) return isDay ? 'sunny' : 'clear';
        if (code <= 2) return isDay ? 'partly sunny' : 'partly cloudy';
        if (code <= 48) return 'cloudy';
        if ((code >= 71 && code <= 77) || code === 85 || code === 86) return 'snowing';
        if (code >= 95) return 'thunderstorms';
        return 'raining';
    }

    function loadWeather() {
        if (request) return;
        request = fetch(url)
            .then(response => {
                if (!response.ok) throw new Error(response.status);
                return response.json();
            })
            .then(data => {
                const { temperature_2m, weather_code, is_day } = data.current;
                tooltip.textContent = `${describe(weather_code, is_day)}, ${Math.round(temperature_2m)}°F in brooklyn right now`;
            })
            .catch(error => {
                console.log('Could not fetch weather:', error);
                tooltip.textContent = 'weather unavailable right now';
                request = null;
            });
    }

    trigger.addEventListener('mouseenter', loadWeather);
    trigger.addEventListener('focus', loadWeather);
});
