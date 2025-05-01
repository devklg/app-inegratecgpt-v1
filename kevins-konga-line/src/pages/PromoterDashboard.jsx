import { useState } from 'react';
import DanceCard from '../components/dashboard/DanceCard';
import TeamGrowth from '../components/dashboard/TeamGrowth';
import MarketStats from '../components/dashboard/MarketStats';
import VideoEmailStats from '../components/dashboard/VideoEmailStats';
import CommissionTracker from '../components/dashboard/CommissionTracker';

function PromoterDashboard() {
  // Sample user data
  const [userData] = useState({
    firstName: "John",
    lastName: "Doe",
    promoterId: "TF-2025-J0HND0E",
    joinDate: "April 25, 2025"
  });
  
  // Dance Card data
  const filledPositions = [0, 1, 2, 3, 4, 6, 7, 8];
  const powerFiveAchievers = [1, 4, 7];
  
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Promoter Dashboard</h1>
      
      {/* Welcome and Stats */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="konga-card p-6 col-span-2">
          <h2 className="text-2xl mb-4">Welcome, <span className="magnificent">{userData.firstName} {userData.lastName}</span>!</h2>
          <p>Promoter ID: {userData.promoterId} | Joined: {userData.joinDate}</p>
        </div>
        
        <CommissionTracker />
      </div>
      
      {/* Team Growth */}
      <TeamGrowth />
      
      {/* Dance Card */}
      <div className="mb-8">
        <h2 className="text-2xl font-bold mb-4">Your Dance Card</h2>
        <DanceCard filledPositions={filledPositions} powerFiveAchievers={powerFiveAchievers} />
      </div>
      
      {/* Stats */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
        <MarketStats />
        <VideoEmailStats />
      </div>
    </div>
  );
}

export default PromoterDashboard;
