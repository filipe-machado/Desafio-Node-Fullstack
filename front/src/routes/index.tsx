import { createBrowserRouter } from "react-router-dom";
import { Home } from "../app/Home";
import ErrorPage from "../app/NotFound";
import { Loading } from "../components/organisms/Loading";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "loading",
    element: <Loading />,
  },
  {
    path: "*",
    element: <ErrorPage />,
  },
]);

export default router;
