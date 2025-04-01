import { jwtDecode } from 'jwt-decode';
// JwtPayload, 

class AuthService {
  getProfile() {
    // TODO: return the decoded token
    console.log('getProfile()', this.getToken());
  }

  loggedIn(): boolean {
    // TODO: return a value that indicates if the user is logged in
    const token = this.getToken();
    return !!token && !this.isTokenExpired(token);
  }
  
  isTokenExpired(token: string) {
    const decodedToken = jwtDecode(token);
    const expirationTime = decodedToken.exp as number;
    const currentTime = Math.floor(Date.now() / 1000);
    
    // TODO: return a value that indicates if the token is expired
    return currentTime > expirationTime;
  }

  getToken(): string {
    // TODO: return the token
    const loggedUser = localStorage.getItem('id_token') || '';
    return loggedUser;
  }

  login(idToken: string) {
    if (idToken) {
      // TODO: set the token to localStorage
      localStorage.setItem('id_token', idToken);
      // TODO: redirect to the home page
      window.location.assign('/');
    }
  }

  logout() {
    // TODO: remove the token from localStorage
    localStorage.removeItem('id_token');
    // TODO: redirect to the login page
    window.location.assign('/');
  }
}

export default new AuthService();
