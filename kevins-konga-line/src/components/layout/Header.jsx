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
