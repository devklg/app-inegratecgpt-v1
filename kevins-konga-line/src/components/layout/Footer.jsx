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
