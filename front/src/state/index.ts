import { create } from "zustand";
import { devtools, persist } from "zustand/middleware";

interface StateProps {
  theme: string;
  changeToNewTheme: (newTheme: string) => void;
}

export const useStore = create<StateProps>()(
  devtools(
    persist(
      (set) => ({
        theme: "dark",
        changeToNewTheme: (newTheme) => set(() => ({ theme: newTheme })),
      }),
      { name: "khipo" }
    )
  )
);
