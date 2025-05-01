// Validate email address format
export const isValidEmail = (email) => {
  const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
};

// Validate phone number format
export const isValidPhone = (phone) => {
  const re = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
  return re.test(String(phone));
};

// Validate name (no numbers or special characters)
export const isValidName = (name) => {
  const re = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
  return re.test(String(name));
};

// Validate password strength
export const isStrongPassword = (password) => {
  // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
  const re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
  return re.test(String(password));
};

// Validate form field is not empty
export const isNotEmpty = (value) => {
  return value.trim() !== '';
};

// Form validation helper
export const validateForm = (formData, rules) => {
  const errors = {};
  
  Object.keys(rules).forEach(field => {
    const value = formData[field];
    const fieldRules = rules[field];
    
    if (fieldRules.required && !isNotEmpty(value)) {
      errors[field] = fieldRules.requiredMessage || 'This field is required';
    } else if (fieldRules.email && value && !isValidEmail(value)) {
      errors[field] = fieldRules.emailMessage || 'Please enter a valid email address';
    } else if (fieldRules.phone && value && !isValidPhone(value)) {
      errors[field] = fieldRules.phoneMessage || 'Please enter a valid phone number';
    } else if (fieldRules.name && value && !isValidName(value)) {
      errors[field] = fieldRules.nameMessage || 'Please enter a valid name';
    } else if (fieldRules.password && value && !isStrongPassword(value)) {
      errors[field] = fieldRules.passwordMessage || 'Password must be at least 8 characters with 1 uppercase, 1 lowercase and 1 number';
    } else if (fieldRules.match && value !== formData[fieldRules.match]) {
      errors[field] = fieldRules.matchMessage || 'Fields do not match';
    } else if (fieldRules.minLength && value.length < fieldRules.minLength) {
      errors[field] = fieldRules.minLengthMessage || `Must be at least ${fieldRules.minLength} characters`;
    }
  });
  
  return errors;
};
