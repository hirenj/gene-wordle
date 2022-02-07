import { BaseModal } from './BaseModal'

type Props = {
  isOpen: boolean
  handleClose: () => void
}

export const AboutModal = ({ isOpen, handleClose }: Props) => {
  return (
    <BaseModal title="About" isOpen={isOpen} handleClose={handleClose}>
      <p className="text-sm text-gray-500 dark:text-gray-300">
        This is gene-based version of the word guessing game we all know and
        love by {' '}
        <a
          href="http://andrewholding.com"
          className="underline font-bold"
        >
          Andrew Holding
        </a>{' '}
      </p>
      <p className="text-sm text-gray-500 dark:text-gray-300">
	Built on the open source version from cwackerfuss - {' '}
        <a
          href="https://github.com/cwackerfuss/react-wordle"
          className="underline font-bold"
        >
          check out the code here
        </a>{' '}
      </p>
    </BaseModal>
  )
}
