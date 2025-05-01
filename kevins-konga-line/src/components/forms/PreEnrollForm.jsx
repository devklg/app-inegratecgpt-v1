import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function PreEnrollForm() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    referrer: 'Kevin Gardner (Konga Leader)'
  });
  
  const [formErrors, setFormErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);
  
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    
    // Clear error when field is edited
    if (formErrors[name]) {
      setFormErrors(prev => ({ ...prev, [name]: null }));
    }
  };
  
  const handleSubmit = (e) => {
    e.preventDefault();
    
    // Basic validation
    const errors = {};
    if (!formData.firstName.trim()) errors.firstName = 'First name is required';
    if (!formData.lastName.trim()) errors.lastName = 'Last name is required';
    if (!formData.email.trim()) errors.email = 'Email is required';
    if (!formData.phone.trim()) errors.phone = 'Phone number is required';
    
    setFormErrors(errors);
    
    if (Object.keys(errors).length === 0) {
      setSubmitting(true);
      
      // Simulate form submission
      setTimeout(() => {
        console.log('Form submitted:', formData);
        setSubmitting(false);
        navigate('/thank-you');
      }, 1500);
    }
  };
  
  return (
    <div className="bg-gray-800 rounded-xl p-8 relative overflow-hidden">
      {/* Decorative elements */}
      <div className="absolute -top-10 -right-10 w-40 h-40 bg-mw-gold opacity-10 rounded-full"></div>
      <div className="absolute -bottom-10 -left-10 w-40 h-40 bg-mw-blue opacity-10 rounded-full"></div>
      
      <form onSubmit={handleSubmit} className="space-y-6 relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label className="block text-gray-400 mb-2">First Name</label>
            <input
              type="text"
              name="firstName"
              value={formData.firstName}
              onChange={handleChange}
              className={`w-full bg-gray-900 border ${formErrors.firstName ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
              placeholder="Your first name"
            />
            {formErrors.firstName && <p className="text-red-500 text-sm mt-1">{formErrors.firstName}</p>}
          </div>
          
          <div>
            <label className="block text-gray-400 mb-2">Last Name</label>
            <input
              type="text"
              name="lastName"
              value={formData.lastName}
              onChange={handleChange}
              className={`w-full bg-gray-900 border ${formErrors.lastName ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
              placeholder="Your last name"
            />
            {formErrors.lastName && <p className="text-red-500 text-sm mt-1">{formErrors.lastName}</p>}
          </div>
        </div>
        
        <div>
          <label className="block text-gray-400 mb-2">Email Address</label>
          <input
            type="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            className={`w-full bg-gray-900 border ${formErrors.email ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
            placeholder="your@email.com"
          />
          {formErrors.email && <p className="text-red-500 text-sm mt-1">{formErrors.email}</p>}
        </div>
        
        <div>
          <label className="block text-gray-400 mb-2">Phone Number</label>
          <input
            type="tel"
            name="phone"
            value={formData.phone}
            onChange={handleChange}
            className={`w-full bg-gray-900 border ${formErrors.phone ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
            placeholder="Your phone number"
          />
          {formErrors.phone && <p className="text-red-500 text-sm mt-1">{formErrors.phone}</p>}
        </div>
        
        <div>
          <label className="block text-gray-400 mb-2">Referred By</label>
          <input
            type="text"
            name="referrer"
            value={formData.referrer}
            readOnly
            className="w-full bg-gray-900 border border-gray-700 rounded-lg px-4 py-3 text-white focus:outline-none"
          />
        </div>
        
        <div className="pt-4">
          <button
            type="submit"
            disabled={submitting}
            className="w-full bg-gradient-to-r from-mw-gold to-yellow-500 hover:from-yellow-500 hover:to-mw-gold text-white text-xl font-bold py-4 px-6 rounded-lg transition duration-300 flex items-center justify-center"
          >
            {submitting ? (
              <>
                <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Processing...
              </>
            ) : (
              <>
                <i className="fas fa-music mr-2"></i> Reserve My Konga Position
              </>
            )}
          </button>
          
          <p className="text
          <p className="text-center text-gray-400 mt-4 text-sm">
            No payment required during pre-enrollment phase.<br />
            Your position is reserved until official launch on May 1, 2025.
          </p>
        </div>
      </form>
    </div>
  );
}

export default PreEnrollForm;
