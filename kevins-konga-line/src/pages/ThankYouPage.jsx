import { useEffect } from 'react';
import { Link } from 'react-router-dom';

function ThankYouPage() {
  // Scroll to top when component mounts
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="container mx-auto px-4 py-16">
      <div className="max-w-3xl mx-auto">
        <div className="konga-card p-8 text-center">
          <div className="w-20 h-20 bg-green-600 rounded-full flex items-center justify-center mx-auto mb-6">
            <i className="fas fa-check text-3xl"></i>
          </div>
          
          <h1 className="text-3xl font-bold mb-4">You're in the Konga Line!</h1>
          
          <p className="text-xl mb-6">
            Thank you for pre-enrolling with Magnificent Worldwide Marketing & Sales Group.
          </p>
          
          <div className="bg-black/30 rounded-lg p-6 mb-8 max-w-md mx-auto">
            <h2 className="text-xl font-bold mb-3">Your Pre-Enrollment Details:</h2>
            <div className="text-left space-y-2">
              <p><span className="text-gray-400">Pre-Enrollment ID:</span> <span className="magnificent">TF-2025042815</span></p>
              <p><span className="text-gray-400">Status:</span> <span className="text-green-500">Confirmed</span></p>
              <p><span className="text-gray-400">Next Steps:</span> Watch for welcome email with login details</p>
            </div>
          </div>
          
          <p className="magnificent text-xl mb-8">
            Get ready to dance your way to success!
          </p>
          
          <div className="mt-10">
            <Link to="/" className="text-mw-gold hover:text-yellow-500 inline-flex items-center">
              <i className="fas fa-arrow-left mr-2"></i> Back to Home
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ThankYouPage;
