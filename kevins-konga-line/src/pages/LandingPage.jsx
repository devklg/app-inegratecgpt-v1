import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import CountdownTimer from '../components/dashboard/CountdownTimer';
import DanceCard from '../components/dashboard/DanceCard';
import PreEnrollForm from '../components/forms/PreEnrollForm';

function LandingPage() {
  // Sample data for demonstration
  const launchDate = 'May 1, 2025 00:00:00';
  const filledPositions = [0, 1, 4, 7, 8]; // Sample Dance Card data
  const powerFiveAchievers = [1]; // Sample Power 5 achievers
  
  // Scroll to section if hash is in URL
  useEffect(() => {
    const hash = window.location.hash;
    if (hash) {
      setTimeout(() => {
        const element = document.querySelector(hash);
        if (element) {
          element.scrollIntoView({ behavior: 'smooth' });
        }
      }, 100);
    }
  }, []);

  return (
    <>
      {/* Hero Section */}
      <section className="relative bg-gradient-to-b from-black to-mw-dark py-20">
        <div className="container mx-auto px-4">
          <div className="text-center">
            <h1 className="text-5xl font-bold mb-4">
              <span className="magnificent">Kevin's Konga Line</span>
            </h1>
            <h2 className="text-2xl mb-8">The Only SaaS That Pays You For Sharing</h2>
            
            {/* Stat Highlight Bar */}
            <div className="flex flex-wrap justify-center gap-8 mb-10 text-center">
              <div className="stat-highlight">
                <div className="text-4xl font-bold magnificent">347B</div>
                <div className="text-sm text-gray-300">Emails Sent Daily</div>
              </div>
              
              <div className="stat-highlight">
                <div className="text-4xl font-bold magnificent">300%</div>
                <div className="text-sm text-gray-300">Higher Engagement</div>
              </div>
              
              <div className="stat-highlight">
                <div className="text-4xl font-bold magnificent">89x</div>
                <div className="text-sm text-gray-300">ROI on Video Email</div>
              </div>
            </div>
            
            <p className="text-xl max-w-3xl mx-auto mb-10">
              Join the future of communication with Talk Fusion's video email platform – where innovation meets opportunity. Get paid in just 1 minute after earning a commission.
            </p>
            
            <div className="mb-10">
              <p className="text-lg mb-3">Pre-enrollment closes in:</p>
              <CountdownTimer targetDate={launchDate} />
            </div>
            
            <div className="flex flex-col md:flex-row items-center justify-center gap-6">
              <a href="#join" className="btn-gold text-lg px-8 py-4 rounded-full flex items-center">
                <i className="fas fa-music mr-2"></i> Join the Konga Line
              </a>
              
              <a href="#dance-card" className="bg-transparent border-2 border-mw-gold hover:bg-mw-gold/20 text-white text-lg px-8 py-4 rounded-full flex items-center">
                <i className="fas fa-info-circle mr-2"></i> Learn More
              </a>
            </div>
          </div>
        </div>
      </section>
      
      {/* Dance Card Preview Section */}
      <section id="dance-card" className="py-20 bg-black">
        <div className="container mx-auto px-4">
          <div className="text-center mb-10">
            <h2 className="text-4xl font-bold mb-6">Fill Your <span className="magnificent">Dance Card</span></h2>
            <p className="text-xl max-w-3xl mx-auto mb-12">
              Every letter in "KEVIN'S KONGA" represents a position in your organization. 
              As your team grows, you'll fill your dance card and unlock amazing rewards!
            </p>
          </div>
          
          {/* Sample Dance Card */}
          <div className="max-w-4xl mx-auto">
            <DanceCard filledPositions={filledPositions} powerFiveAchievers={powerFiveAchievers} />
          </div>
          
          <div className="text-center mt-12">
            <p className="text-xl mb-6">Ready to start filling your dance card?</p>
            <a href="#join" className="btn-gold text-lg px-8 py-3 rounded-lg inline-flex items-center">
              <i className="fas fa-id-card mr-2"></i> Get Your Dance Card
            </a>
          </div>
        </div>
      </section>
      
      {/* Pre-enrollment Form Section */}
      <section id="join" className="py-20 bg-gray-900">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-4xl font-bold mb-6">Join <span className="magnificent">Kevin's Konga Line</span> Now!</h2>
            <p className="text-xl max-w-3xl mx-auto">
              Reserve your position in the world's most exciting word-of-mouth phenomenon!
            </p>
          </div>
          
          <div className="max-w-3xl mx-auto">
            <PreEnrollForm />
          </div>
        </div>
      </section>
    </>
  );
}

export default LandingPage;
