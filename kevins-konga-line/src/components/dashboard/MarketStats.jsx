function MarketStats() {
  return (
    <div className="konga-card p-6 mb-8">
      <h3 className="text-xl font-bold mb-6">Email Market Trends</h3>
      
      {/* Basic placeholder content */}
      <div className="space-y-4">
        <div>
          <div className="flex justify-between mb-1">
            <span>Email Usage Growth</span>
            <span className="magnificent">3% YoY</span>
          </div>
          <div className="w-full bg-gray-700 h-2 rounded-full">
            <div className="bg-mw-gold h-2 rounded-full" style={{width: '65%'}}></div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default MarketStats;
