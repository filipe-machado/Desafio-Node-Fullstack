import { Card, CardProps } from "primereact/card";
import "./index.scss";
import { CustomButton } from "../Button";

type CustomCardProps = CardProps & {
  iconPath: string;
  iconFill?: string;
  mainheader: string;
  subheader: string;
  buttonLabel: string;
};

export const CustomCard = ({ ...props }: CustomCardProps) => {
  return (
    <Card {...props}>
      <div className="flex flex-row justify-content-between">
        <div className="flex flex-column">
          <div className="flex flex-row">
            <svg width="30" height="30" viewBox="0 0 24 24">
              <path d={props.iconPath} fill={props.iconFill || "#EBF0F9"} />
            </svg>
            <h2>{props.mainheader}</h2>
          </div>
          <p>{props.subheader}</p>
        </div>
        <div className="flex">
          <CustomButton className="p-card__button" label={props.buttonLabel} />
        </div>
      </div>
    </Card>
  );
};
