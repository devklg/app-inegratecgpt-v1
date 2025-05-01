import { useState, useEffect } from 'react'

function DanceCard({ filledPositions = [], powerFiveAchievers = [] }) {
  // KEVIN'S KONGA structure as pyramid
  const kongaPositions = [
    {letter: 'K', level: 1, position: 'center', x: 50, y: 0},     // You
    {letter: 'E', level: 2, position: 'left', x: 30, y: 20},      // Level 2 left
    {letter: 'V', level: 2, position: 'right', x: 70, y: 20},     // Level 2 right
    {letter: 'I', level: 3, position: 'left', x: 20, y: 40},      // Level 3 far left
    {letter: 'N', level: 3, position: 'center-left', x: 40, y: 40}, // Level 3 center-left
    {letter: "'", level: 3, position: 'center-right', x: 60, y: 40}, // Level 3 center-right
    {letter: 'S', level: 3, position: 'right', x: 80, y: 40},     // Level 3 far right
    {letter: 'K', level: 4, position: 'far-left', x: 10, y: 60},  // Level 4 positions
    {letter: 'O', level: 4, position: 'left', x: 30, y: 60},
    {letter: 'N', level: 4, position: 'center', x: 50, y: 60},
    {letter: 'G', level: 4, position: 'right', x: 70, y: 60},
    {letter: 'A', level: 4, position: 'far-right', x: 90, y: 60}
  ];
  
  // Animation states for newly filled positions
  const [animatingPositions, setAnimatingPositions] = useState([]);
  
  // Check for newly filled positions to animate them
  useEffect(() => {
    const newFilled = filledPositions.filter(pos => !animatingPositions.includes(pos));
    if (newFilled.length > 0) {
      setAnimatingPositions(prev => [...prev, ...newFilled]);
    }
  }, [filledPositions]);

  return (
    <div className="konga-card p-6 relative overflow-hidden">
      <h3 className="text-2xl font-bold mb-2 text-center">Your <span className="magnificent">Power 5 Dance Card</span></h3>
      <p className="text-center mb-8">Share with 5 people who share with 5 more!</p>
      
      {/* Next Conversion Notice */}
      <div className="bg-black/50 rounded-lg p-3 mb-6 text-center">
        <p className="text-sm">Next conversion cycle:</p>
        <p className="magnificent text-lg font-bold">Thursday Dance Party - 2 days remaining</p>
      </div>
      
      {/* Power 5 Pyramid Visualization */}
      <div className="relative h-[300px] w-full mb-8">
        {/* Connecting Lines */}
        <svg className="absolute inset-0 w-full h-full z-0">
          {/* Level 1 to Level 2 connections */}
          <line x1="50%" y1="10%" x2="30%" y


    <line x1="50%" y1="10%" x2="30%" y2="25%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="50%" y1="10%" x2="70%" y2="25%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          
          {/* Level 2 to Level 3 connections */}
          <line x1="30%" y1="25%" x2="20%" y2="45%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="30%" y1="25%" x2="40%" y2="45%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="70%" y1="25%" x2="60%" y2="45%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="70%" y1="25%" x2="80%" y2="45%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          
          {/* Level 3 to Level 4 connections */}
          <line x1="20%" y1="45%" x2="10%" y2="65%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="20%" y1="45%" x2="30%" y2="65%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="40%" y1="45%" x2="50%" y2="65%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="60%" y1="45%" x2="70%" y2="65%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
          <line x1="80%" y1="45%" x2="90%" y2="65%" stroke="rgba(183, 161, 49, 0.5)" strokeWidth="2" />
        </svg>
        
        {/* Position Nodes */}
        {kongaPositions.map((item, index) => {
          const isFilled = filledPositions.includes(index);
          const isPower5 = powerFiveAchievers.includes(index);
          const isAnimating = animatingPositions.includes(index);
          
          return (
            <div 
              key={index}
              className={\`absolute w-14 h-14 rounded-full flex items-center justify-center transform -translate-x-1/2 -translate-y-1/2 border-2 \${
                isFilled 
                  ? isPower5 
                    ? 'border-purple-500 bg-purple-500/30 shadow-lg shadow-purple-500/50' 
                    : 'border-mw-gold bg-mw-gold/20' 
                  : 'border-gray-600 bg-gray-900/50'
              } \${isAnimating ? 'join-pop' : ''}\`}
              style={{
                left: \`\${item.x}%\`,
                top: \`\${item.y}%\`,
              }}
            >
              <span className={\`text-2xl font-bold \${isPower5 ? 'text-purple-300' : isFilled ? 'text-mw-gold' : 'text-white'}\`}>
                {item.letter}
              </span>
              
              {/* Status Indicators */}
              {isFilled && (
                <div className={\`absolute -top-2 -right-2 w-5 h-5 \${isPower5 ? 'bg-purple-500' : 'bg-green-500'} rounded-full flex items-center justify-center text-white \${isAnimating ? 'pulse-glow' : ''}\`}>
                  {isPower5 ? '5' : <i className="fas fa-check text-xs"></i>}
                </div>
              )}
              
              {!isFilled && (
                <div className="absolute -top-2 -right-2 w-5 h-5 bg-gray-700 rounded-full flex items-center justify-center">
                  <i className="fas fa-user-plus text-xs text-gray-400"></i>
                </div>
              )}
            </div>
          );
        })}
      </div>
      
      {/* Status and Progress */}
      <div className="grid grid-cols-2 gap-4 mb-6">
        <div className="bg-black/30 p-4 rounded-lg">
          <h4 className="text-sm text-gray-400 mb-1">Dance Card Status</h4>
          <p className="text-xl">
            <span className="text-green-500 font-bold">{filledPositions.length}</span> of <span className="magnificent">12</span> Filled
          </p>
          <div className="w-full bg-gray-700 h-2 rounded-full mt-2">
            <div 
              className="bg-gradient-to-r from-mw-gold to-yellow-500 h-2 rounded-full" 
              style={{width: \`\${(filledPositions.length / 12) * 100}%\`}}
            ></div>
          </div>
        </div>
        
        <div className="bg-black/30 p-4 rounded-lg">
          <h4 className="text-sm text-gray-400 mb-1">Power 5 Champions</h4>
          <p className="text-xl">
            <span className="text-purple-500 font-bold">{powerFiveAchievers.length}</span> of <span className="magnificent">12</span> Achieved
          </p>
          <div className="w-full bg-gray-700 h-2 rounded-full mt-2">
            <div 
              className="bg-gradient-to-r from-purple-600 to-purple-400 h-2 rounded-full" 
              style={{width: \`\${(powerFiveAchievers.length / 12) * 100}%\`}}
            ></div>
          </div>
        </div>
      </div>
      
      {/* Weekly Conversion Schedule */}
      <div className="bg-black/40 rounded-lg p-4">
        <h4 className="font-bold mb-3">Weekly Conversion Schedule:</h4>
        <div className="flex items-center justify-between mb-2">
          <div className="flex items-center">
            <div className="w-8 h-8 rounded-full bg-mw-gold flex items-center justify-center mr-2">
              <i className="fas fa-music"></i>
            </div>
            <span>Thursday Dance Party</span>
          </div>
          <span className="text-sm text-gray-400">Every Thursday</span>
        </div>
        <div className="flex items-center justify-between">
          <div className="flex items-center">
            <div className="w-8 h-8 rounded-full bg-mw-blue flex items-center justify-center mr-2">
              <i className="fas fa-coffee"></i>
            </div>
            <span>Monday Morning Moves</span>
          </div>
          <span className="text-sm text-gray-400">Every Monday</span>
        </div>
      </div>
      
      {/* Video Email Statistics */}
      <div className="mt-6 pt-6 border-t border-gray-700">
        <h4 className="font-bold mb-3">Video Email Implementation Impact:</h4>
        
        <ul className="space-y-3">
          <li className="flex items-start">
            <div className="w-5 h-5 rounded-full bg-green-500 mr-3 flex-shrink-0 mt-1 flex items-center justify-center">
              <i className="fas fa-check text-xs"></i>
            </div>
            <div>
              <span className="font-bold">First 3 positions filled:</span> 
              <span> Access to Talk Fusion's video email technology that increases response rates by <span className="magnificent">300%</span></span>
            </div>
          </li>
          
          <li className="flex items-start">
            <div className="w-5 h-5 rounded-full bg-gray-700 mr-3 flex-shrink-0 mt-1 flex items-center justify-center">
              <span className="text-xs">6</span>
            </div>
            <div>
              <span className="font-bold">First 6 positions filled:</span>
              <span> Join the top <span className="magnificent">23%</span> of businesses leveraging video email technology</span>
            </div>
          </li>
          
          <li className="flex items-start">
            <div className="w-5 h-5 rounded-full bg-gray-700 mr-3 flex-shrink-0 mt-1 flex items-center justify-center">
              <span className="text-xs">9</span>
            </div>
            <div>
              <span className="font-bold">First 9 positions filled:</span>
              <span> Achieve the <span className="magnificent">34.2%</span> conversion rate advantage of video email marketing</span>
            </div>
          </li>
          
          <li className="flex items-start">
            <div className="w-5 h-5 rounded-full bg-gray-700 mr-3 flex-shrink-0 mt-1 flex items-center justify-center">
              <span className="text-xs">12</span>
            </div>
            <div>
              <span className="font-bold">All positions filled:</span>
              <span> Unlock full <span className="magnificent">$89 ROI</span> potential for every $1 invested in your business</span>
            </div>
          </li>
        </ul>
      </div>
      
      {/* Power 5 Context Statistics */}
      <div className="bg-gray-900 p-6 rounded-xl mt-6">
        <h4 className="font-bold mb-3 text-center">The Power 5 Advantage</h4>
        
        <div className="grid grid-cols-2 gap-4 mb-4">
          <div className="text-center">
            <div className="text-4xl font-bold magnificent mb-1">5→3,125</div>
            <p className="text-sm text-gray-400">Potential team size from sharing with just 5 people</p>
          </div>
          
          <div className="text-center">
            <div className="text-4xl font-bold magnificent mb-1">27%</div>
            <p className="text-sm text-gray-400">Higher engagement with focused Word of Mouth</p>
          </div>
        </div>
        
        <div className="text-center">
          <p className="text-sm">
            <i className="fas fa-quote-left text-mw-gold mr-1"></i>
            Organizations implementing video email technology experience an average 27% improvement in customer engagement metrics and 23% higher conversion rates.
            <i className="fas fa-quote-right text-mw-gold ml-1"></i>
          </p>
          <p className="text-xs text-gray-500 mt-1">- Harvard Business Review, Special Report on Business Communication, 2024</p>
        </div>
      </div>
    </div>
  );
}

export default DanceCard;
