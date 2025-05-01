function TeamGrowth() {
  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
      <div className="konga-card p-6 text-center">
        <h3 className="text-xl mb-2">Total Pre-Enrollees</h3>
        <div className="text-4xl font-bold magnificent mb-2">5,487</div>
        <p className="text-gray-400">People in the system</p>
      </div>
      
      <div className="konga-card p-6 text-center">
        <h3 className="text-xl mb-2">Your Downline</h3>
        <div className="text-4xl font-bold magnificent mb-2">4</div>
        <p className="text-gray-400">People in your organization</p>
      </div>
      
      <div className="konga-card p-6 text-center">
        <h3 className="text-xl mb-2">Potential Earnings</h3>
        <div className="text-4xl font-bold magnificent mb-2">$350</div>
        <p className="text-gray-400">Estimated monthly income</p>
      </div>
    </div>
  );
}

export default TeamGrowth;
