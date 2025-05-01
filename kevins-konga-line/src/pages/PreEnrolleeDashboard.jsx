import { useState } from 'react';
import CountdownTimer from '../components/dashboard/CountdownTimer';
import DanceCard from '../components/dashboard/DanceCard';
import TeamGrowth from '../components/dashboard/TeamGrowth';
import MarketStats from '../components/dashboard/MarketStats';
import VideoEmailStats from '../components/dashboard/VideoEmailStats';

function PreEnrolleeDashboard() {
  // Demo user data
  const userData = {
    firstName: "John",
    lastName: "Doe",
    preEnrollmentId: "TF-2025042815"
  };
  
  // Demo Dance Card data
  const filledPositions = [0, 1, 4, 7, 8];
  const powerFiveAchievers = [1];
  
  // Next conversion target date
  const nextConversion = 'April 30, 2025 23:59:59';
  
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Pre-Enrollee Dashboard</h1>
      
      {/* Welcome and Countdown */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div className="konga-card p-6">
          <h2 className="text-2xl mb-4">Welcome, <span className="magnificent">{userData.firstName}</span>!</h2>
          <p className="mb-6">Your pre-enrollment is confirmed. Explore your dashboard to see your position in Kevin's Konga Line!</p>
          <p>Pre-Enrollment ID: <span className="magnificent">{userData.preEnrollmentId}</span></p>
        </div>
        
        <div className="konga-card p-6">
          <h2 className="text-2xl mb-4">Next Conversion Countdown</h2>
          <CountdownTimer targetDate={nextConversion} />
        </div>
      </div>
      
      {/* Dance Card */}
      <div className="mb-8">
        <h2 className="text-2xl font-bold mb-4">Your Dance Card</h2>
        <DanceCard filledPositions={filledPositions} powerFiveAchievers={powerFiveAchievers} />
      </div>
      
      {/* Team Growth Stats */}
      <TeamGrowth />
      
      {/* Market Stats */}
      <MarketStats />
      
      {/* Video Email Stats */}
      <VideoEmailStats />
    </div>
  );
}

export default PreEnrolleeDashboard;
