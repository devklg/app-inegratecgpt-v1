import { useState, useEffect } from 'react';

function CountdownTimer({ targetDate, onComplete }) {
  const [timeLeft, setTimeLeft] = useState({
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0
  });
  
  const [isComplete, setIsComplete] = useState(false);

  useEffect(() => {
    const calculateTimeLeft = () => {
      const now = new Date().getTime();
      const target = new Date(targetDate).getTime();
      const difference = target - now;

      if (difference > 0) {
        setTimeLeft({
          days: Math.floor(difference / (1000 * 60 * 60 * 24)),
          hours: Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)),
          minutes: Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)),
          seconds: Math.floor((difference % (1000 * 60)) / 1000)
        });
      } else if (!isComplete) {
        setIsComplete(true);
        setTimeLeft({ days: 0, hours: 0, minutes: 0, seconds: 0 });
        if (onComplete) onComplete();
      }
    };
    
    calculateTimeLeft();
    const timer = setInterval(calculateTimeLeft, 1000);
    
    return () => clearInterval(timer);
  }, [targetDate, isComplete, onComplete]);

  // Format numbers to always have two digits
  const formatNumber = (num) => {
    return String(num).padStart(2, '0');
  };

  return (
    <div className="flex justify-center space-x-4">
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.days)}</div>
        <div className="text-xs uppercase text-gray-400">Days</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.hours)}</div>
        <div className="text-xs uppercase text-gray-400">Hours</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.minutes)}</div>
        <div className="text-xs uppercase text-gray-400">Minutes</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.seconds)}</div>
        <div className="text-xs uppercase text-gray-400">Seconds</div>
      </div>
    </div>
  );
}

export default CountdownTimer;
