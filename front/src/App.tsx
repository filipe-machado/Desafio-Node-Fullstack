import { PrimeReactProvider } from "primereact/api";
import { RouterProvider } from "react-router-dom";
import router from "./routes";
import "primeicons/primeicons.css";
import "primeflex/primeflex.css";

function App() {
  const value = {
    ripple: true,
  };

  return (
    <PrimeReactProvider value={value}>
      <RouterProvider router={router} />
    </PrimeReactProvider>
  );
}

export default App;
