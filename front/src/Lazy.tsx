import React, { Suspense } from "react";
import { Loading } from "./components/organisms/Loading/index.tsx";

const App = React.lazy(() => import("./App.tsx"));

export const Lazy = () => {
  return (
    <Suspense fallback={<Loading />}>
      <App />
    </Suspense>
  );
};
