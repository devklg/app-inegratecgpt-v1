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
