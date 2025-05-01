#!/bin/bash
# Script to create the file structure for Kevin's Konga Line app

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Creating Kevin's Konga Line project structure...${NC}\n"

# Create the base project using Vite
echo -e "${YELLOW}Setting up Vite project...${NC}"
if [ -d "kevins-konga-line" ]; then
  log_warning "'kevins-konga-line' already exists. Please delete it or rename before running this script."
  exit 1
fi

npm create vite@latest kevins-konga-line --template react
cd kevins-konga-line

# Install dependencies
echo -e "${YELLOW}Installing dependencies...${NC}"
npm install react-router-dom @fortawesome/fontawesome-free
npm install -D tailwindcss@^4.0.0 postcss autoprefixer @tailwindcss/vite

# Initialize Tailwind CSS
echo -e "${YELLOW}Setting up Tailwind CSS...${NC}"
npx tailwindcss init -p

# Create the directory structure
echo -e "${YELLOW}Creating directory structure...${NC}"

# Create public directories
mkdir -p public/images

# Create source directories
mkdir -p src/components/layout
mkdir -p src/components/dashboard
mkdir -p src/components/landing
mkdir -p src/components/forms
mkdir -p src/pages
mkdir -p src/context
mkdir -p src/hooks
mkdir -p src/utils
mkdir -p src/data
mkdir -p src/styles

# Create placeholder for images
touch public/images/logo.png
touch public/images/kevin-gardner.jpg
touch public/images/dance-card-bg.svg
touch public/images/email-evolution.svg
touch public/images/powerline-diagram.svg

# Create configuration files
echo -e "${YELLOW}Creating configuration files...${NC}"

# Create tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'mw-dark': '#1a1a1a',
        'mw-card': '#2a2a2a',
        'mw-gold': '#b7a131',
        'mw-blue': '#3588ce',
        'mw-darkblue': '#118277',
        'mw-red': '#b72515',
      },
      fontFamily: {
        'sans': ['Open Sans', 'sans-serif'],
        'display': ['Montserrat', 'sans-serif'],
      },
      animation: {
        'bounce-slow': 'bounce 3s infinite',
        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      }
    },
  },
  plugins: [],
}
EOF

# Create vite.config.js
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  build: {
    outDir: 'dist',
    minify: 'terser',
    sourcemap: false,
  },
  server: {
    port: 3000,
    strictPort: true,
    open: true,
  }
})
EOF

# Update index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/png" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kevin's Konga Line - Magnificent Worldwide Marketing & Sales Group</title>
    <meta name="description" content="Join Kevin Gardner's Konga Line and revolutionize your Talk Fusion business with our exclusive powerline system. Get in line, follow the moves, and watch your earnings grow!" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF

# Create CSS files
echo -e "${YELLOW}Creating style files...${NC}"

# Create index.css
cat > src/styles/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --mw-dark: #1a1a1a;
  --mw-card: #2a2a2a;
  --mw-gold: #b7a131;
  --mw-blue: #3588ce;
  --mw-darkblue: #118277;
  --mw-red: #b72515;
}

body {
  background-color: var(--mw-dark);
  color: #ffffff;
  font-family: 'Open Sans', sans-serif;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Montserrat', sans-serif;
}

@layer components {
  .konga-card {
    @apply bg-mw-card rounded-xl shadow-lg shadow-black/30 transition-all duration-300;
  }
  
  .konga-card:hover {
    @apply shadow-xl shadow-mw-gold/20 transform -translate-y-1;
  }
  
  .btn-primary {
    @apply bg-mw-blue text-white py-2 px-6 rounded-lg transition-all duration-300 hover:bg-mw-darkblue;
  }
  
  .btn-gold {
    @apply bg-mw-gold text-white py-2 px-6 rounded-lg transition-all duration-300 hover:bg-yellow-600;
  }
  
  .magnificent {
    @apply text-mw-gold font-bold;
  }
  
  .stat-highlight {
    @apply p-4 bg-black bg-opacity-50 rounded-lg;
  }
  
  .stat-card {
    @apply p-6 bg-gray-800 rounded-xl;
  }
  
  .stat-item {
    @apply p-4 rounded-lg bg-black bg-opacity-40 border border-gray-700;
  }
}
EOF

# Create animations.css
cat > src/styles/animations.css << 'EOF'
/* Dance Card animations */
@keyframes kongaDance {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-5px); }
}

.konga-dance {
  animation: kongaDance 2s ease-in-out infinite;
}

/* Card fill animation */
@keyframes cardFill {
  0% { background-color: rgba(183, 161, 49, 0); }
  50% { background-color: rgba(183, 161, 49, 0.4); }
  100% { background-color: rgba(183, 161, 49, 0.2); }
}

.dance-card-fill {
  animation: cardFill 1s forwards;
}

/* Number counter animation */
@keyframes countUp {
  0% { opacity: 0; transform: translateY(10px); }
  100% { opacity: 1; transform: translateY(0); }
}

.count-up {
  animation: countUp 0.5s ease-out forwards;
}

/* Pulse glow */
@keyframes pulseGlow {
  0%, 100% { box-shadow: 0 0 0 rgba(183, 161, 49, 0); }
  50% { box-shadow: 0 0 20px rgba(183, 161, 49, 0.5); }
}

.pulse-glow {
  animation: pulseGlow 2s infinite;
}

/* New member join animation */
@keyframes joinPop {
  0% { transform: scale(0.8); opacity: 0; }
  50% { transform: scale(1.1); }
  100% { transform: scale(1); opacity: 1; }
}

.join-pop {
  animation: joinPop 0.5s ease-out forwards;
}
EOF

# Create utility files
echo -e "${YELLOW}Creating utility files...${NC}"

# Create formatters.js
cat > src/utils/formatters.js << 'EOF'
// Format currency values
export const formatCurrency = (value) => {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(value);
};

// Format dates
export const formatDate = (dateString) => {
  const options = { year: 'numeric', month: 'long', day: 'numeric' };
  return new Date(dateString).toLocaleDateString('en-US', options);
};

// Format numbers with commas
export const formatNumber = (value) => {
  return new Intl.NumberFormat('en-US').format(value);
};

// Format phone numbers
export const formatPhoneNumber = (phoneNumberString) => {
  const cleaned = ('' + phoneNumberString).replace(/\D/g, '');
  const match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
  if (match) {
    return '(' + match[1] + ') ' + match[2] + '-' + match[3];
  }
  return phoneNumberString;
};

// Format percentage
export const formatPercentage = (value) => {
  return `${value}%`;
};

// Time ago formatter
export const timeAgo = (date) => {
  const seconds = Math.floor((new Date() - new Date(date)) / 1000);
  
  let interval = seconds / 31536000;
  if (interval > 1) return Math.floor(interval) + ' years ago';
  
  interval = seconds / 2592000;
  if (interval > 1) return Math.floor(interval) + ' months ago';
  
  interval = seconds / 86400;
  if (interval > 1) return Math.floor(interval) + ' days ago';
  
  interval = seconds / 3600;
  if (interval > 1) return Math.floor(interval) + ' hours ago';
  
  interval = seconds / 60;
  if (interval > 1) return Math.floor(interval) + ' minutes ago';
  
  return 'just now';
};
EOF

# Create validators.js
cat > src/utils/validators.js << 'EOF'
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
EOF

# Create base components
echo -e "${YELLOW}Creating base components...${NC}"

# Create main.jsx
cat > src/main.jsx << 'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './styles/index.css'
import './styles/animations.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOF

# Create App.jsx
cat > src/App.jsx << 'EOF'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { lazy, Suspense } from 'react'
import Layout from './components/layout/Layout'

// Lazy loaded pages for better performance
const LandingPage = lazy(() => import('./pages/LandingPage'))
const LoginPage = lazy(() => import('./pages/LoginPage'))
const PreEnrolleeDashboard = lazy(() => import('./pages/PreEnrolleeDashboard'))
const PromoterDashboard = lazy(() => import('./pages/PromoterDashboard'))
const ThankYouPage = lazy(() => import('./pages/ThankYouPage'))

// Loading fallback
const Loading = () => (
  <div className="flex items-center justify-center min-h-screen">
    <div className="text-center">
      <div className="w-16 h-16 border-4 border-mw-gold border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
      <p className="text-xl">Loading Kevin's Konga Line...</p>
    </div>
  </div>
)

function App() {
  return (
    <Router>
      <Suspense fallback={<Loading />}>
        <Routes>
          <Route path="/" element={<Layout><LandingPage /></Layout>} />
          <Route path="/login" element={<Layout><LoginPage /></Layout>} />
          <Route path="/dashboard/pre-enrollee" element={<Layout><PreEnrolleeDashboard /></Layout>} />
          <Route path="/dashboard/promoter" element={<Layout><PromoterDashboard /></Layout>} />
          <Route path="/thank-you" element={<Layout><ThankYouPage /></Layout>} />
        </Routes>
      </Suspense>
    </Router>
  )
}

export default App
EOF

# Create Layout components
cat > src/components/layout/Layout.jsx << 'EOF'
import Header from './Header'
import Footer from './Footer'

function Layout({ children }) {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-grow">
        {children}
      </main>
      <Footer />
    </div>
  )
}

export default Layout
EOF

cat > src/components/layout/Header.jsx << 'EOF'
import { useState } from 'react'
import { Link, useLocation } from 'react-router-dom'

function Header() {
  const [menuOpen, setMenuOpen] = useState(false)
  const location = useLocation()
  
  const isActive = (path) => location.pathname === path
  
  const toggleMenu = () => setMenuOpen(!menuOpen)
  
  return (
    <header className="bg-black py-4">
      <div className="container mx-auto px-4 flex justify-between items-center">
        <Link to="/" className="flex items-center">
          <img src="/images/logo.png" alt="Magnificent Worldwide Marketing" className="h-10 mr-3" />
          <h1 className="text-xl font-bold">
            <span className="magnificent">Magnificent</span> Worldwide
          </h1>
        </Link>
        
        {/* Mobile menu button */}
        <button 
          onClick={toggleMenu}
          className="md:hidden text-white focus:outline-none"
        >
          <i className={`fas ${menuOpen ? 'fa-times' : 'fa-bars'} text-xl`}></i>
        </button>
        
        {/* Desktop navigation */}
        <nav className="hidden md:flex items-center space-x-6">
          <Link 
            to="/" 
            className={`${isActive('/') ? 'text-mw-gold' : 'text-white'} hover:text-mw-gold transition-colors`}
          >
            Home
          </Link>
          <Link 
            to="/#dance-card" 
            className="hover:text-mw-gold transition-colors"
          >
            Dance Card
          </Link>
          <Link 
            to="/#join" 
            className="hover:text-mw-gold transition-colors"
          >
            Join Now
          </Link>
          <Link 
            to="/login" 
            className={`${isActive('/login') ? 'text-mw-gold' : 'text-white'} hover:text-mw-gold transition-colors`}
          >
            Login
          </Link>
        </nav>
        
        <Link to="/#join" className="hidden md:block btn-gold">
          Pre-Enroll Now
        </Link>
        
        {/* Mobile menu dropdown */}
        {menuOpen && (
          <div className="md:hidden absolute top-full left-0 right-0 bg-black z-50 border-t border-gray-800">
            <div className="container mx-auto px-4 py-4">
              <nav className="flex flex-col space-y-4">
                <Link 
                  to="/" 
                  onClick={() => setMenuOpen(false)}
                  className={`${isActive('/') ? 'text-mw-gold' : 'text-white'} hover:text-mw-gold transition-colors`}
                >
                  Home
                </Link>
                <Link 
                  to="/#dance-card" 
                  onClick={() => setMenuOpen(false)}
                  className="hover:text-mw-gold transition-colors"
                >
                  Dance Card
                </Link>
                <Link 
                  to="/#join" 
                  onClick={() => setMenuOpen(false)}
                  className="hover:text-mw-gold transition-colors"
                >
                  Join Now
                </Link>
                <Link 
                  to="/login" 
                  onClick={() => setMenuOpen(false)}
                  className={`${isActive('/login') ? 'text-mw-gold' : 'text-white'} hover:text-mw-gold transition-colors`}
                >
                  Login
                </Link>
                <Link 
                  to="/#join"
                  onClick={() => setMenuOpen(false)} 
                  className="btn-gold text-center"
                >
                  Pre-Enroll Now
                </Link>
              </nav>
            </div>
          </div>
        )}
      </div>
    </header>
  )
}

export default Header
EOF

cat > src/components/layout/Footer.jsx << 'EOF'
import { Link } from 'react-router-dom'

function Footer() {
  return (
    <footer className="bg-black py-10">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <h3 className="text-xl font-bold mb-4">
              <span className="magnificent">Magnificent</span> Worldwide
            </h3>
            <p className="text-gray-400">
              Using technology to build our technology business worldwide.
            </p>
          </div>
          
          <div>
            <h3 className="text-xl font-bold mb-4">Contact Us</h3>
            <p className="text-gray-400 mb-2">
              <i className="fas fa-envelope mr-2"></i> support@magnificentworldwide.com
            </p>
            <p className="text-gray-400">
              <i className="fas fa-phone mr-2"></i> +1 (555) 123-4567
            </p>
          </div>
          
          <div>
            <h3 className="text-xl font-bold mb-4">Connect With Us</h3>
            <div className="flex space-x-4">
              <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-mw-gold transition-colors">
                <i className="fab fa-facebook-f text-xl"></i>
              </a>
              <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-mw-gold transition-colors">
                <i className="fab fa-twitter text-xl"></i>
              </a>
              <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-mw-gold transition-colors">
                <i className="fab fa-instagram text-xl"></i>
              </a>
              <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-mw-gold transition-colors">
                <i className="fab fa-linkedin-in text-xl"></i>
              </a>
            </div>
          </div>
        </div>
        
        <div className="border-t border-gray-800 mt-8 pt-8 text-center text-gray-500">
          <p>© 2025 Magnificent Worldwide Marketing & Sales Group. All rights reserved.</p>
          <p className="mt-2 text-sm">
            Talk Fusion is a registered trademark of Talk Fusion, Inc.
          </p>
          <div className="mt-4 flex justify-center space-x-6 text-sm">
            <Link to="/privacy-policy" className="hover:text-mw-gold transition-colors">Privacy Policy</Link>
            <Link to="/terms-of-service" className="hover:text-mw-gold transition-colors">Terms of Service</Link>
            <Link to="/income-disclaimer" className="hover:text-mw-gold transition-colors">Income Disclaimer</Link>
          </div>
        </div>
      </div>
    </footer>
  )
}

export default Footer
EOF

# Create Dashboard components
echo -e "${YELLOW}Creating dashboard components...${NC}"

# Create CountdownTimer.jsx
cat > src/components/dashboard/CountdownTimer.jsx << 'EOF'
import { useState, useEffect } from 'react';

function CountdownTimer({ targetDate, onComplete }) {
  const [timeLeft, setTimeLeft] = useState({
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0
  });
  
  const [isComplete, setIsComplete] = useState(false);

  useEffect(() => {
    const calculateTimeLeft = () => {
      const now = new Date().getTime();
      const target = new Date(targetDate).getTime();
      const difference = target - now;

      if (difference > 0) {
        setTimeLeft({
          days: Math.floor(difference / (1000 * 60 * 60 * 24)),
          hours: Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)),
          minutes: Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)),
          seconds: Math.floor((difference % (1000 * 60)) / 1000)
        });
      } else if (!isComplete) {
        setIsComplete(true);
        setTimeLeft({ days: 0, hours: 0, minutes: 0, seconds: 0 });
        if (onComplete) onComplete();
      }
    };
    
    calculateTimeLeft();
    const timer = setInterval(calculateTimeLeft, 1000);
    
    return () => clearInterval(timer);
  }, [targetDate, isComplete, onComplete]);

  // Format numbers to always have two digits
  const formatNumber = (num) => {
    return String(num).padStart(2, '0');
  };

  return (
    <div className="flex justify-center space-x-4">
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.days)}</div>
        <div className="text-xs uppercase text-gray-400">Days</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.hours)}</div>
        <div className="text-xs uppercase text-gray-400">Hours</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.minutes)}</div>
        <div className="text-xs uppercase text-gray-400">Minutes</div>
      </div>
      
      <div className="bg-black p-4 rounded-lg w-20 text-center">
        <div className="text-3xl font-bold magnificent">{formatNumber(timeLeft.seconds)}</div>
        <div className="text-xs uppercase text-gray-400">Seconds</div>
      </div>
    </div>
  );
}

export default CountdownTimer;
EOF

# Create DanceCard.jsx
cat > src/components/dashboard/DanceCard.jsx << 'EOF'
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
EOF

# Create CommissionTracker.jsx
cat > src/components/dashboard/CommissionTracker.jsx << 'EOF'
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
EOF

# Create MarketStats.jsx (placeholder)
cat > src/components/dashboard/MarketStats.jsx << 'EOF'
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
EOF

# Create VideoEmailStats.jsx (placeholder)
cat > src/components/dashboard/VideoEmailStats.jsx << 'EOF'
function VideoEmailStats() {
  return (
    <div className="konga-card p-6 mb-8">
      <h3 className="text-xl font-bold mb-6">Video Email Performance Metrics</h3>
      
      {/* Basic placeholder content */}
      <div className="bg-gray-900 p-4 rounded-lg mt-8">
        <h4 className="font-bold mb-4 text-center">Communication Elements Captured</h4>
        <p className="text-center">Video Email: <span className="magnificent">93%</span> vs Text Email: <span className="text-gray-400">7%</span></p>
      </div>
    </div>
  );
}

export default VideoEmailStats;
EOF

# Create TeamGrowth.jsx (placeholder)
cat > src/components/dashboard/TeamGrowth.jsx << 'EOF'
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
EOF

# Create forms components
echo -e "${YELLOW}Creating form components...${NC}"

# Create PreEnrollForm.jsx (basic version)
cat > src/components/forms/PreEnrollForm.jsx << 'EOF'
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
EOF

# Create LoginForm.jsx
cat > src/components/forms/LoginForm.jsx << 'EOF'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function LoginForm() {
  const navigate = useNavigate();
  
  const [formData, setFormData] = useState({
    email: '',
    password: '',
    rememberMe: false
  });
  
  const [formErrors, setFormErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  
  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    const val = type === 'checkbox' ? checked : value;
    
    setFormData(prev => ({ ...prev, [name]: val }));
    
    // Clear error when field is edited
    if (formErrors[name]) {
      setFormErrors(prev => ({ ...prev, [name]: null }));
    }
  };
  
  const validateForm = () => {
    const errors = {};
    
    if (!formData.email.trim()) {
      errors.email = 'Email is required';
    }
    
    if (!formData.password) {
      errors.password = 'Password is required';
    }
    
    setFormErrors(errors);
    return Object.keys(errors).length === 0;
  };
  
  const handleSubmit = (e) => {
    e.preventDefault();
    
    if (validateForm()) {
      setIsSubmitting(true);
      
      // Simulate API call
      setTimeout(() => {
        console.log('Login attempted with:', formData);
        setIsSubmitting(false);
        
        // Simulate successful login - redirect to dashboard
        // In a real app, this would be determined by user role
        navigate('/dashboard/pre-enrollee');
      }, 1000);
    }
  };

  return (
    <div className="konga-card p-8">
      <form onSubmit={handleSubmit} className="space-y-6">
        <div>
          <label className="block text-gray-400 mb-2" htmlFor="email">Email Address</label>
          <input
            id="email"
            name="email"
            type="email"
            autoComplete="email"
            value={formData.email}
            onChange={handleChange}
            className={`w-full bg-gray-900 border ${formErrors.email ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
            placeholder="your@email.com"
          />
          {formErrors.email && <p className="text-red-500 text-sm mt-1">{formErrors.email}</p>}
        </div>
        
        <div>
          <label className="block text-gray-400 mb-2" htmlFor="password">Password</label>
          <input
            id="password"
            name="password"
            type="password"
            autoComplete="current-password"
            value={formData.password}
            onChange={handleChange}
            className={`w-full bg-gray-900 border ${formErrors.password ? 'border-red-500' : 'border-gray-700'} rounded-lg px-4 py-3 text-white focus:outline-none focus:ring-2 focus:ring-mw-gold`}
            placeholder="••••••••"
          />
          {formErrors.password && <p className="text-red-500 text-sm mt-1">{formErrors.password}</p>}
        </div>
        
        <div className="flex items-center justify-between">
          <div className="flex items-center">
            <input
              id="remember-me"
              name="rememberMe"
              type="checkbox"
              checked={formData.rememberMe}
              onChange={handleChange}
              className="h-4 w-4 text-mw-gold focus:ring-mw-gold border-gray-700 rounded"
            />
            <label htmlFor="remember-me" className="ml-2 block text-gray-400">
              Remember me
            </label>
          </div>
          
          <div>
            <a href="#" className="text-mw-gold hover:text-yellow-500">
              Forgot password?
            </a>
          </div>
        </div>
        
        <div>
          <button
            type="submit"
            disabled={isSubmitting}
            className="w-full btn-gold py-3 rounded-lg flex items-center justify-center"
          >
            {isSubmitting ? (
              <>
                <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Signing in...
              </>
            ) : 'Sign in'}
          </button>
        </div>
      </form>
      
      <div className="mt-8 text-center">
        <p className="text-gray-400">
          Don't have an account?{' '}
          <a href="/#join" className="text-mw-gold hover:text-yellow-500">
            Pre-enroll for free
          </a>
        </p>
      </div>
    </div>
  );
}

export default LoginForm;
EOF

# Create page components (placeholders for main pages)
echo -e "${YELLOW}Creating page components...${NC}"

# Create LandingPage.jsx (simple placeholder)
cat > src/pages/LandingPage.jsx << 'EOF'
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
EOF

# Create LoginPage.jsx
cat > src/pages/LoginPage.jsx << 'EOF'
import LoginForm from '../components/forms/LoginForm';

function LoginPage() {
  return (
    <div className="min-h-[calc(100vh-300px)] flex items-center justify-center py-12 px-4">
      <div className="max-w-md w-full">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold">Welcome Back</h1>
          <p className="text-gray-400 mt-2">Sign in to access your dashboard</p>
        </div>
        
        <LoginForm />
      </div>
    </div>
  );
}

export default LoginPage;
EOF

# Create placeholders for other pages
cat > src/pages/PreEnrolleeDashboard.jsx << 'EOF'
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
EOF

cat > src/pages/PromoterDashboard.jsx << 'EOF'
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
EOF

cat > src/pages/ThankYouPage.jsx << 'EOF'
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
EOF

echo -e "${YELLOW}Creating package.json with correct dependencies...${NC}"

# Update package.json with dependencies
cat > package.json << 'EOF'
{
  "name": "kevins-konga-line",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint . --ext js,jsx --report-unused-disable-directives --max-warnings 0",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.22.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.48",
    "@types/react-dom": "^18.2.18",
    "@vitejs/plugin-react": "^4.2.1",
    "autoprefixer": "^10.4.17",
    "eslint": "^8.56.0",
    "eslint-plugin-react": "^7.33.2",
    "eslint-plugin-react-hooks": "^4.6.0",
    "eslint-plugin-react-refresh": "^0.4.5",
    "postcss": "^8.4.33",
    "tailwindcss": "^3.4.1",
    "vite": "^5.0.12"
  }
}
EOF

# Create robots.txt
echo -e "${YELLOW}Creating robots.txt...${NC}"
cat > public/robots.txt << 'EOF'
# robots.txt for Kevin's Konga Line
User-agent: *
Allow: /
EOF

# Create deployment instructions
echo -e "${YELLOW}Creating deployment instructions for Hostinger...${NC}"
cat > HOSTINGER_DEPLOYMENT.md << 'EOF'
# Deployment Instructions for Hostinger

## 1. Build the Project
npm run build


## 2. Preparing Files for Hostinger
- The build process will create a `dist` folder with all necessary files
- Compress the contents of the `dist` folder into a ZIP file if easier to upload

## 3. Upload to Hostinger
- Log in to your Hostinger account
- Navigate to File Manager or use FTP
- Upload the contents of the `dist` folder to your public_html directory (or a subdirectory if preferred)

## 4. Configure for React Router
- Create or edit an .htaccess file in your root directory
- Add the following rules:

RewriteEngine On RewriteBase / RewriteRule ^index\.html$ - [L] RewriteCond %{REQUEST_FILENAME} !-f RewriteCond %{REQUEST_FILENAME} !-d RewriteRule . /index.html [L] ```
5. Verify Deployment
Visit your domain to ensure the site is working correctly
Test navigation between pages
Verify that forms and interactive elements are functioning
6. Final Steps
Set up any required DNS records if using a custom domain
Configure SSL certificate through Hostinger
Test the site on multiple devices and browsers EOF
Install dependencies
echo -e "
AND
AND
L
L
THE
IN
I
n
s
t
a
l
l
i
n
g
d
and
p
and
n
d
and
n
c
i
and
s
.
.
.
YELLOWInstallingdependencies...{NC}" npm install

Final steps and instructions
echo -e "\n
G
R
AND
AND
N
P
r
the
GREENProjectstructureforKevin 
′
 sKongaLinecreatedsuccessfully!{NC}" echo -e "\n
B
L
IN
AND
N
and
x
t
s
t
and
p
s
:
BLUENextsteps:{NC}" echo -e "1. Run
AND
AND
L
L
THE
IN
n
p
m
r
in
n
d
and
in
YELLOWnpmrundev{NC} to start the development server" echo -e "2. Edit the components in the src directory as needed" echo -e "3. When ready for production, run
AND
AND
L
L
THE
IN
n
p
m
r
in
n
b
in
i
l
d
YELLOWnpmrunbuild{NC}" echo -e "4. Upload the files from the dist folder to your Hostinger hosting" echo -e "\n
B
L
IN
AND
F
the
r
d
and
p
l
the
and
m
and
n
t
i
n
s
t
r
in
c
t
i
the
n
s
,
s
and
and
:
BLUEFordeploymentinstructions,see:{NC} ./HOSTINGER_DEPLOYMENT.md" echo -e "\n
G
R
AND
AND
N
H
a
p
p
and
c
the
d
i
n
g
!
AND
the
in
r
K
and
in
i
n
′
s
K
the
n
g
a
L
i
n
and
p
r
the
j
and
c
t
i
s
r
and
a
d
and
f
the
r
d
and
in
and
l
the
p
m
and
n
t
.
GREENHappycoding!YourKevin 
′
 sKo n g a L in e p ro j ec t i sre a d y f or d e v e l o p m e n t .{NC}"


Save this script as `setup_konga_line.sh` and run it with:

 
```bash
bash setup_konga_line.sh
bash
cat > README.md << 'EOF'
Save this script as \`setup_konga_line.sh\` and run it with:

\`\`\`bash
bash setup_konga_line.sh
\`\`\`
EOF
