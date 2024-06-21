import { Button, ButtonProps } from "primereact/button";
import "./index.scss";

export const CustomButton = ({ ...props }: ButtonProps) => {
  return <Button {...props} />;
};
