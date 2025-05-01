import { useState } from 'react';

function CommissionTracker() {
  // Initial state with empty values for user to fill
  const [commissionData, setCommissionData] = useState({
    fastStart: '',
    teamCommissions: '',
    megaMatching: '',
    rankAdvancement: '',
    leadershipPool: '',
    totalEarned: ''
  });
  
  const [isEditing, setIsEditing] = useState(false);
  const [tempData, setTempData] = useState({...commissionData});

  // Handle input changes
  const handleChange = (e) => {
    const { name, value } = e.target;
    
    // Only allow numbers and decimals
    if (value === '' || /^\d+(\.\d{0,2})?$/.test(value)) {
      setTempData(prev => ({
        ...prev,
        [name]: value
      }));
    }
  };
  
  // Calculate total based on input fields
  const calculateTotal = () => {
    const total = Object.keys(tempData)
      .filter(key => key !== 'totalEarned') // Exclude total from calculation
      .reduce((sum, key) => {
        const value = parseFloat(tempData[key]) || 0;
        return sum + value;
      }, 0);
    
    setTempData(prev => ({
      ...prev,
      totalEarned: total.toFixed(2)
    }));
  };
  
  // Save changes
  const saveChanges = () => {
    calculateTotal();
    setCommissionData({...tempData});
    setIsEditing(false);
  };
  
  // Cancel editing
  const cancelEdit = () => {
    setTempData({...commissionData});
    setIsEditing(false);
  };

  return (
    <div className="konga-card p-6">
      <div className="flex justify-between items-center mb-4">
        <h3 className="text-xl font-bold">Your Earnings</h3>
        
        {isEditing ? (
          <div className="flex space-x-2">
            <button 
              onClick={saveChanges}
              className="text-green-500 hover:text-green-400 text-sm flex items-center"
            >
              <i className="fas fa-check mr-1"></i> Save
            </button>
            <button 
              onClick={cancelEdit}
              className="text-gray-400 hover:text-gray-300 text-sm flex items-center"
            >
              <i className="fas fa-times mr-1"></i> Cancel
            </button>
          </div>
        ) : (
          <button 
            onClick={() => setIsEditing(true)}
            className="text-mw-gold hover:text-yellow-500 text-sm flex items-center"
          >
            <i className="fas fa-edit mr-1"></i> Update
          </button>
        )}
      </div>
      
      {isEditing ? (
        <div className="space-y-4">
          <div>
            <label className="text-sm text-gray-400 mb-1 block">Fast Start Bonuses ($)</label>
            <input
              type="text"
              name="fastStart"
              value={tempData.fastStart}
              onChange={handleChange}
              className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-1 focus:ring-mw-gold"
              placeholder="0.00"
            />
          </div>
          
          <div>
            <label className="text-sm text-gray-400 mb-1 block">Team Commissions ($)</label>
            <input
              type="text"
              name="teamCommissions"
              value={tempData.teamCommissions}
              onChange={handleChange}
              className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-1 focus:ring-mw-gold"
              placeholder="0.00"
            />
          </div>
          
          <div>
            <label className="text-sm text-gray-400 mb-1 block">Mega Matching Bonuses ($)</label>
            <input
              type="text"
              name="megaMatching"
              value={tempData.megaMatching}
              onChange={handleChange}
              className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-1 focus:ring-mw-gold"
              placeholder="0.00"
            />
          </div>
          
          <div>
            <label className="text-sm text-gray-400 mb-1 block">Rank Advancement ($)</label>
            <input
              type="text"
              name="rankAdvancement"
              value={tempData.rankAdvancement}
              onChange={handleChange}
              className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-1 focus:ring-mw-gold"
              placeholder="0.00"
            />
          </div>
          
          <div>
            <label className="text-sm text-gray-400 mb-1 block">Leadership Pool ($)</label>
            <input
              type="text"
              name="leadershipPool"
              value={tempData.leadershipPool}
              onChange={handleChange}
              className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-1 focus:ring-mw-gold"
              placeholder="0.00"
            />
          </div>
          
          <button 
            onClick={calculateTotal}
            className="btn-primary w-full py-2 rounded-lg mt-2"
          >
            Calculate Total
          </button>
        </div>
      ) : (
        <>
          <div className="space-y-4">
            {commissionData.fastStart && (
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Fast Start Bonuses</span>
                  <span className="magnificent">${commissionData.fastStart}</span>
                </div>
                <div className="w-full h-2 bg-gray-700 rounded-full"></div>
              </div>
            )}
            
            {commissionData.teamCommissions && (
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Team Commissions</span>
                  <span className="magnificent">${commissionData.teamCommissions}</span>
                </div>
                <div className="w-full h-2 bg-gray-700 rounded-full"></div>
              </div>
            )}
            
            {commissionData.megaMatching && (
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Mega Matching Bonuses</span>
                  <span className="magnificent">${commissionData.megaMatching}</span>
                </div>
                <div className="w-full h-2 bg-gray-700 rounded-full"></div>
              </div>
            )}
            
            {commissionData.rankAdvancement && (
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Rank Advancement</span>
                  <span className="magnificent">${commissionData.rankAdvancement}</span>
                </div>
                <div className="w-full h-2 bg-gray-700 rounded-full"></div>
              </div>
            )}
            
            {commissionData.leadershipPool && (
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Leadership Pool</span>
                  <span className="magnificent">${commissionData.leadershipPool}</span>
                </div>
                <div className="w-full h-2 bg-gray-700 rounded-full"></div>
              </div>
            )}
            
            {!commissionData.totalEarned && (
              <div className="text-center py-6 text-gray-400">
                <i className="fas fa-hand-holding-usd text-3xl mb-2 text-mw-gold"></i>
                <p>Track your Talk Fusion commissions here</p>
                <p className="text-sm">Click "Update" to add your earnings</p>
              </div>
            )}
          </div>
          
          {commissionData.totalEarned > 0 && (
            <div className="mt-6 pt-4 border-t border-gray-700">
              <div className="flex justify-between items-center">
                <span className="font-bold">Total Earned</span>
                <span className="text-2xl magnificent">${commissionData.totalEarned}</span>
              </div>
              <p className="text-xs text-gray-400 text-right mt-1">Paid instantly in 1 minute!</p>
            </div>
          )}
        </>
      )}
      
      <div className="mt-6 bg-black/30 p-3 rounded-lg text-sm text-center">
        <p><i className="fas fa-info-circle mr-1"></i> Talk Fusion pays commissions instantly in 1 minute!</p>
      </div>
    </div>
  );
}

export default CommissionTracker;
