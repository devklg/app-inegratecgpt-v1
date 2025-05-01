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
