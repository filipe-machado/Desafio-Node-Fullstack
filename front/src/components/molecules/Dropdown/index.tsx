import { Dropdown, DropdownProps } from "primereact/dropdown";
import "./index.scss";

export const CustomDropdown = ({ ...props }: DropdownProps) => {
  return <Dropdown {...props} />;
};
