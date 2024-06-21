import { ProgressSpinner } from "primereact/progressspinner";
import "./index.scss";

export const Loading = () => {
  return (
    <div className="spinner">
      <ProgressSpinner />
    </div>
  );
};
